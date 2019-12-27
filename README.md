# pycounter
pycounter is a sample web application "request counter", used to compare [Docker and Docker Compose](https://docs.docker.com/reference/) configurations and container linking.

The `/counter` endpoint returns the current request count.

```bash
http://localhost:5000/counter
```

The current request count is reset using the `/reset` endpoint.
```bash
http://localhost:5000/reset
```

Note: [Redis](https://hub.docker.com/_/redis/) is used to track the request count.

## prerequisites
pycounter was developed using Docker 19 and Compose 1.24 on OS X.
  
```bash
$ docker -v
Docker version 19.03.5, build 633a0ea

$ docker-compose -v
docker-compose version 1.24.1, build 4667896b
```

Installation guides are available for [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/)

## build the pycounter image
using docker cli 
```bash
docker build -t pycounter/pycounter:1.0.0 .
```
. . . or using docker-compose
```bash
docker-compose build
```

## docker cli execution
The `start` and `stop` functions in [manage-containers.sh](manage-containers.sh) use the docker cli to manage
the application's containers.

Docker components used include:
- pycounter application container
- redis container
- bridge network to support container integration

To start the application
```bash
./manage-container.sh start
```

The command will output pycounter's networking and container resources. Once the command is complete browse to 
`http://localhost:5000/counter` to view the current request count.

To stop the application
```bash
./manage-containers.sh stop
```

## docker compose execution
Start pycounter compose services using
```bash
docker-compose up -d
```

Stop pycounter compose services using
```bash
docker-compose down
```
