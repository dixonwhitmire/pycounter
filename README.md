#pycounter
pycounter is a sample web application used to demonstrate [Docker and Docker Compose](https://docs.docker.com/reference/)
container implementations and linking.

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
```bash
docker build -t <your dockerhub repo or username>/pycounter:1.0.0 .
```

## docker execution
To launch pycounter using docker cli, execute the [manage-containers script](manage-containers.sh)
```bash
./manage-container.sh start
```

The command will output pycounter's networking and container resources. Once the command is complete browse to 
`http://localhost:5000/counter` to view the current request count.

Use manage containers to remove pycounter's container and networking resources
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


