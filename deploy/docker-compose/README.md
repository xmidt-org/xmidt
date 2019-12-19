# Deploying XMiDT

## Docker

In order to deploy into Docker, make sure [Docker is installed](https://docs.docker.com/install/).

#### Deploy
_**Note**_: While Tr1d1um is not part of XMiDT(it is WebPA), it is recommended to be
brought up for current ease of use. Future releases will deprecate Tr1d1um.

1. Clone this repository

2. Run `deploy/docker-compose/deploy.sh`
   
    This will build `simulator` and `goaws` locally. It will then run `docker-compose up` which uses images of `talaria`, `scytale`, `petasos`, `caduceus`, and `tr1d1um` from dockerhub. 

    To pull specific versions of the images, just set the `<SERVICE>_VERSION` env variables when running the shell script.

    ```
    TALARIA_VERSION=x.x.x deploy/docker-compose/deploy.sh
    ```

    If you only want to bring up, for example, the scytale and talaria, run:
    ```bash
    deploy/docker-compose/deploy.sh scytale talaria
    ```
    _**Note**_: Bringing up a subset of services can cause problems.
    
    This can be done with any combination of services.

3. To bring the containers down:
   ```bash
   docker-compose -f deploy/docker-compose/docker-compose.yml down
   ```

### INFO
The docker-compose file provides 1 full datacenter with one talaria in a "backup"
datacenter. Since this is pure docker, not swarm or kubernetes, it's easiest to
deal with just one datacenter. Since all ports are exposed, the names might seem a little weird.

#### Connection
##### Inside Docker
If the Parodus instance is inside of docker, life is easy! Just connect to the cluster with `petasos:6400`.

##### Outside Docker
if the Parodus instance is outside of docker and the ports are exposed correctly, life
will be hard since you will need to handle the redirect.
You can initially connect to 'localhost:6400' but on the redirect change `talaria-1:6210` to `localhost:6210`

or you can just connect to a talaria `localhost:6200`

Once connected you should see it connected via [metrics](http://localhost:9090/graph?g0.range_input=1h&g0.expr=xmidt_talaria_device_count&g0.tab=0)

### Interact with the machines

Checkout that petasos is working:
```
curl -i -H "X-Webpa-Device-Name: mac:112233445566" "http://localhost:6400"
```

Should give you the following:
```
HTTP/1.1 307 Temporary Redirect
Content-Type: text/html; charset=utf-8
Location: http://talaria-0:6200
X-Petasos-Build: development
X-Petasos-Flavor: development
X-Petasos-Region: local
X-Petasos-Server: localhost
X-Petasos-Start-Time: 04 Jun 19 02:12 UTC
Date: Tue, 04 Jun 2019 02:16:58 GMT
Content-Length: 57

<a href="http://talaria-0:6200">Temporary Redirect</a>.
```

Checkout that tr1d1um is able to talk with scytale & talaria:
```
curl -i -H "Authorization: Basic dXNlcjpwYXNz" "http://localhost:6100/api/v2/device/mac:112233445577/config?names=Foo"
```

Should give you:
```
HTTP/1.1 404 Not Found
X-Scytale-Build: development
X-Scytale-Flavor: development
X-Scytale-Region: local
X-Scytale-Server: localhost
X-Scytale-Start-Time: 04 Jun 19 02:12 UTC
X-Talaria-Build: development
X-Talaria-Flavor: development
X-Talaria-Region: local
X-Talaria-Server: localhost
X-Talaria-Start-Time: 04 Jun 19 02:12 UTC
X-Tr1d1um-Build: development
X-Tr1d1um-Flavor: development
X-Tr1d1um-Region: local
X-Tr1d1um-Server: localhost
X-Tr1d1um-Start-Time: 04 Jun 19 02:11 UTC
X-Webpa-Transaction-Id: LQxoB5sUSGWPNgAzxRIXLA
X-Xmidt-Message-Error: The device does not exist
X-Xmidt-Span: "http://petasos:6400/api/v2/device/send","2019-06-04T02:27:26Z","2.185274ms"
Date: Tue, 04 Jun 2019 02:27:26 GMT
Content-Length: 87
Content-Type: text/plain; charset=utf-8

{"code": 404, "message": "Could not process device request: The device does not exist"}
```

Check out that your simulator is connected:

```
curl -i -H "Authorization: Basic dXNlcjpwYXNz" "http://localhost:6100/api/v2/device/mac:112233445566/stat"
```

Should give you something similar to:

```
HTTP/1.1 200 OK
Content-Type: application/json
X-Scytale-Build: development
X-Scytale-Flavor: development
X-Scytale-Region: local
X-Scytale-Server: localhost
X-Scytale-Start-Time: 10 Jun 19 06:36 UTC
X-Talaria-Build: development
X-Talaria-Flavor: development
X-Talaria-Region: local
X-Talaria-Server: localhost
X-Talaria-Start-Time: 10 Jun 19 06:36 UTC
X-Tr1d1um-Build: development
X-Tr1d1um-Flavor: development
X-Tr1d1um-Region: local
X-Tr1d1um-Server: localhost
X-Tr1d1um-Start-Time: 10 Jun 19 06:36 UTC
X-Webpa-Transaction-Id: CIyqnI23RjWhyC_vNO7hbA
X-Xmidt-Span: "http://petasos:6400/api/v2/device/mac:112233445566/stat","2019-06-10T06:38:13Z","2.947332ms"
Date: Mon, 10 Jun 2019 06:38:13 GMT
Content-Length: 231

{"id": "mac:112233445566", "pending": 0, "statistics": {"bytesSent": 0, "messagesSent": 0, "bytesReceived": 0, "messagesReceived": 0, "duplications": 0, "connectedAt": "2019-06-10T06:37:02.915435853Z", "upTime": "1m10.110197482s"}}
```

Read a single parameter:

```
curl -i -H "Authorization: Basic dXNlcjpwYXNz" "http://localhost:6100/api/v2/device/mac:112233445566/config?names=Device.DeviceInfo.X_CISCO_COM_BootloaderVersion"
```

Results in:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Scytale-Build: development
X-Scytale-Flavor: development
X-Scytale-Region: local
X-Scytale-Server: localhost
X-Scytale-Start-Time: 10 Jun 19 06:36 UTC
X-Talaria-Build: development
X-Talaria-Flavor: development
X-Talaria-Region: local
X-Talaria-Server: localhost
X-Talaria-Start-Time: 10 Jun 19 06:36 UTC
X-Tr1d1um-Build: development
X-Tr1d1um-Flavor: development
X-Tr1d1um-Region: local
X-Tr1d1um-Server: localhost
X-Tr1d1um-Start-Time: 10 Jun 19 06:36 UTC
X-Webpa-Transaction-Id: cDYIIKLgoDtrt3XrVfUKkg
X-Xmidt-Span: "http://petasos:6400/api/v2/device/send","2019-06-10T06:45:04Z","15.869854ms"
Date: Mon, 10 Jun 2019 06:45:04 GMT
Content-Length: 163

{"parameters":[{"name":"Device.DeviceInfo.X_CISCO_COM_BootloaderVersion","value":"4.2.0.45","dataType":0,"parameterCount":1,"message":"Success"}],"statusCode":200}
```
