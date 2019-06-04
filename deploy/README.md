# Deploying XMiDT

## Docker

In order to deploy into Docker, make sure [Docker is installed](https://docs.docker.com/install/).

#### Deploy
_note:_ While tr1d1um is not part of XMiDT(it is WebPA) it is recommend to be
brought up for current ease of use. Future releases will deprecate tr1d1um.

1. Have the services you want to bring up built (Talaria, Scytale, etc.).

  - Build the images locally
  ```bash
  # for each service
  cd <# service #>
  git pull origin master
  # notice the dot
  docker build -t <# service #>:local .
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

   # This is WebPA not XMiDT
   export TR1D1UM_VERSION=local
   ```
   If you don't want to set environment variables, set them inline with each
   `docker-compose` command below.

3. To bring the containers up run:
   ```bash
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
