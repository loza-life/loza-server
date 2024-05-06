# loza-server

Docker downloads from here: https://hub.docker.com/r/sea5kg/loza-server


Started from this project https://github.com/x-color/vue-trello

Build server:

```
$ go build -o loza-server main.go
```

Run server:

```
$ ./loza-server
```


Docker image build:

```
$ docker rmi sea5kg/loza-server:latest
$ docker build -t sea5kg/loza-server:latest .
$ docker tag sea5kg/loza-server:latest sea5kg/loza-server:v1.0.0
```

Run docker:
```
$ docker run --rm -v `pwd`/server_data:/data sea5kg/loza-server:latest
```
