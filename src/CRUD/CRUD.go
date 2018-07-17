package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
)

var auth string

func makeRequest(requestType, mac, messageType, source, transId, dest, contentType, payload string, client *http.Client) {

	var deviceName string
	deviceName = fmt.Sprintf("mac:%s/%s", mac, dest)
	
	headers := make(map[string]string)
	
	headers["Authorization"] = auth
	var req *http.Request
	var err error
	var url string

	if "POST" == requestType {
		headers["X-Xmidt-Message-Type"]= messageType
		headers["X-Xmidt-Content-Type"]= contentType
		headers["X-Xmidt-Transaction-Uuid"]= transId
		headers["X-Xmidt-Source"]= source
		headers["X-Webpa-Device-Name"]= deviceName
		
		url = fmt.Sprintf("https://api.xmidt.comcast.net/api/v2/device")
		fmt.Printf("Received Request %s, %s \n", messageType, url)
		
		req, err = http.NewRequest(requestType, url, bytes.NewBufferString(payload))
	}
	

	if err != nil {
		fmt.Printf("Request %s failed: %s, %v\n", requestType, url, err)
	}

	for k, v := range headers {
		req.Header.Set(k, v)
	}
	
	resp, err := client.Do(req)
	
	if err != nil {
		fmt.Printf("Failed to obtain request: %v\n", err)
	} else {
	
		var res map[string]interface{}
		dec := json.NewDecoder(resp.Body)
		dec.UseNumber()
		dec.Decode(&res)

		if 200 != resp.StatusCode {
			fmt.Printf("Failed. resp.StatusCode %v \n", resp.StatusCode)
		} else {
			fmt.Printf("Success. resp.StatusCode %v\n", resp.StatusCode)
		}
		io.Copy(ioutil.Discard, resp.Body)
		resp.Body.Close()
	}
}

func main() {
	if "" == os.Getenv("WEBPA_SAT") {
		fmt.Printf("Environment variable WEBPA_SAT must be set a valid SAT token.")
		return
	}

	auth = "Bearer " + os.Getenv("WEBPA_SAT")

	var maxConnReuse uint
	var requestType, mac, messageType, source, dest, contentType, transId, payload string

	flag.StringVar(&mac, "mac", "", "device-id")
	flag.StringVar(&messageType, "messageType", "", "type of the request to send")
	flag.StringVar(&payload, "payload", "", "the payload to send to apply")
	
	flag.StringVar(&source, "source", "", "source value for CRUD operations")
	flag.StringVar(&dest, "dest", "", "CRUD dest value to apply")
	flag.StringVar(&transId, "transId", "", "transId for CRUD operations")
	flag.StringVar(&contentType, "contentType", "", "contentType for CRUD operations")
	flag.UintVar(&maxConnReuse, "max-reuse", 100, "the maximum number of connection re-use attempts -- (advanced)")

	flag.Parse()

	if "" == messageType{
		fmt.Printf("Please provide messageType option\n")
		return
	} else if "" != messageType {
		requestType = "POST"
		if "Create" == messageType || "Update" == messageType {
			if "" == payload {
				fmt.Printf("Please provide payload option\n")
				return
			}
		}
		
		if "" == source || "" == dest || "" == transId || "" == contentType {
			fmt.Printf("Please provide the required arguments: source, dest, transId, contentType\n")
			return
		}
	}

	client := &http.Client{
		Transport: &http.Transport{
			MaxIdleConnsPerHost: int(maxConnReuse),
		},
	}

	fmt.Printf("Request Type: %s, Payload: %s\n", requestType, payload)
	makeRequest(requestType, mac, messageType, source, transId, dest, contentType, payload, client)

}
