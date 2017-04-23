FROM debian:jessie

MAINTAINER cloudyparts "cloudyparts@icloud.com"

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install socat

COPY assets/macos-socat /usr/local/bin

EXPOSE 2375

CMD [ "/usr/local/bin/macos-socat" ]
