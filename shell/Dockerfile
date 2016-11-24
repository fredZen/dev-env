FROM debian:jessie

RUN apt-get update \
 && apt-get install -y apt-transport-https ca-certificates \
 && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && echo deb https://apt.dockerproject.org/repo debian-jessie main >> /etc/apt/sources.list.d/docker.list \
 && apt-get update \
 && apt-get install -y \
    curl \
	docker-engine \
	vim \
 && rm -rf /var/lib/apt/lists/* \
 && curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

WORKDIR /home

CMD ["/bin/bash", "-c", "exec sleep infinity"]
