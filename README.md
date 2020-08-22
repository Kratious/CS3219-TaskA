# CS3219-TaskA

This repository includes 3 containers.

The first, a nginx reverse proxy container that directs two ports `8080` and `8081` to the two other containers.

The `8080` port is directed to an nginx web server.

The `8081` port is directed to an apache web server.

# Setup

`$ docker-compose up -d`

`$ docker container ls`

```
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                                      NAMES
4b2933574382        nginx:alpine            "/docker-entrypoint.…"   24 seconds ago      Up 23 seconds       80/tcp                                     cs3219-taska_nginx_1
7e7d85841fd8        httpd:alpine            "httpd-foreground"       24 seconds ago      Up 23 seconds       80/tcp                                     cs3219-taska_apache_1
fec816d93282        kratious/reverseproxy   "/docker-entrypoint.…"   24 seconds ago      Up 23 seconds       80/tcp, 0.0.0.0:8080-8081->8080-8081/tcp   cs3219-taska_reverseproxy_1
```

Execute the kratious/reverseproxy container

`$ docker exec -it fec816d93282 /bin/bash`

Inside the reverseproxy container, run the commands:

`$ curl localhost:8080`

```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
...
```

`$ curl localhost:8081`

```
<html><body><h1>It works!</h1></body></html>
```

The reverse proxy can be seen to be working by directing the ports to the web servers in the two other containers.