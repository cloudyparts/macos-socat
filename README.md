> expose a tcp socket for accessing docker API on macOS

# macos-socat

## Why?

The [Docker for Mac](https://docs.docker.com/engine/installation/mac/) native macOS application provides use of docker engine without the need for vagrant or other virtualized linux operating system. Docker for Mac does not provide the same docker daemon configuration options as other versions of docker-engine. macOS-socat uses `socat` to establish a tcp socket bound to localhost which makes available the Docker for Mac API.

## Getting Started

### Install

```shell
$ docker pull cloudyparts/macos-socat
```

### Usage

```shell
$ docker run --detach \
	--publish 127.0.0.1:2375:2375 \
	--volume=/var/run/docker.sock:/var/run/docker.sock \
	cloudyparts/macos-socat
```

***WARNING:*** The Docker API is unsecure by default. Please remember to bind the TCP socket to the `localhost` interface otherwise the Docker API will be bound to all interfaces..


