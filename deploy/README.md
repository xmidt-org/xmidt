# Deploying XMiDT

## Docker

In order to deploy into Docker, make sure [Docker is installed](https://docs.docker.com/install/).

#### Deploy
_note:_ While tr1d1um is not part of XMiDT(it is WebPA) it is recommend to be
brought up for current ease of use. Future releases will deprecate tr1d1um.

1. Have the services you want to bring up built (Talaria, Scytale, etc.).

  - Build the images locally
  ```bash
git clone git@github.com:Comcast/xmidt.git
git clone git@github.com:Comcast/talaria.git
git clone git@github.com:Comcast/scytale.git
git clone git@github.com:Comcast/petasos.git
git clone git@github.com:Comcast/caduceus.git
git clone git@github.com:Comcast/tr1d1um.git

cd talaria
docker build -t talaria:local .
cd ..

cd scytale
docker build -t scytale:local .
cd ..

cd petasos
docker build -t petasos:local .
cd ..

cd caduceus
docker build -t caduceus:local .
cd ..

cd tr1d1um
docker build -t tr1d1um:local .
cd ..

cd xmidt/simulator
docker build -t simulator:local .
cd ../..
  ```

  _note_: for building goaws:local since master breaks docker networking
  ```
  git clone git@github.com:kcajmagic/goaws.git
  cd goaws
  git checkout adding_http_support
  docker build -t goaws:local .
  ```

2. Set an environment variables relevant for the services you are deploying. If
   you aren't using locally built images, replace `local` with the correct tag:
   _note_ currently the images are not hosted anywhere
   ```bash
   export TALARIA_VERSION=local
   export SCYTALE_VERSION=local
   export CADUCEUS_VERSION=local
   export PETASOS_VERSION=local

   # This is the client code setup to run locally.
   export SIMULATOR_VERSION=local

   # This is WebPA not XMiDT
   export TR1D1UM_VERSION=local
   ```
   If you don't want to set environment variables, set them inline with each
   `docker-compose` command below.

3. To bring the containers up run:
   ```bash
   cd xmidt/deploy/docker-compose
   docker-compose up -d
   ```
   If you only want to bring up, for example, the scytale and talaria, run:
   _note_: bringup a subset can cause problems
   ```bash
   docker-compose up -d scytale talaria
   ```
   This can be done with any combination of services and the database.

4. To bring the containers down:
   ```bash
   docker-compose down
   ```

### INFO
The docker-compose file provides 1 full datacenter with on talaria in a "backup"
datacenter. since this is just pure docker no swarm or kubernetes its easiest to
deal with just one dc, and since all ports are exposed the names might seem a little weird.

#### Connection
##### Inside Docker
If the parodus instance is inside of docker, life is easy just connect to the cluster with `petasos:6400`

##### Outside Docker
if you the agent is outside of docker and the ports are exposed correctly life
will be hard since you will need to handle the redirect.
You can initially connect to 'localhost:6400' but on the redirect change `talaria-1:6210` to `localhost:6210`

or you can just connect to a talaria `localhost:6200`

Once connected you should see it connected via [metrics](http://localhost:9090/graph?g0.range_input=1h&g0.expr=xmidt_talaria_device_count&g0.tab=0)

### Interact with the machines

Checkout that petasos is working:
```
curl localhost:6400 -H "X-Webpa-Device-Name: mac:112233445566" -i
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
curl localhost:6100/api/v2/device/mac:112233445577/config?names=Foo -i -H "Authorization: Basic dXNlcjpwYXNz"
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
curl -H "Authorization: Basic dXNlcjpwYXNz" localhost:6100/api/v2/device/mac:112233445566/stat -i
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
curl -H "Authorization: Basic dXNlcjpwYXNz" localhost:6100/api/v2/device/mac:112233445566/config?names=Device.DeviceInfo.X_CISCO_COM_BootloaderVersion -i
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
