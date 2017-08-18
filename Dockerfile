FROM debian:jessie

ENV BOOT_AS_ROOT=yes
ENV LEIN_ROOT=yes

RUN apt-get update \
 && apt-get install -y apt-transport-https ca-certificates \
 && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && echo deb https://apt.dockerproject.org/repo debian-jessie main >> /etc/apt/sources.list.d/docker.list \
 && echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-get update \
 && apt-get install -y -t jessie-backports \
    curl \
    docker-engine \
    imagemagick \
    make \
    optipng \
    openjdk-8-jdk-headless \
    pngquant \
    vim \
 && rm -rf /var/lib/apt/lists/* \
 && curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose \
 && curl -fsSLo /usr/local/bin/boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh \
 && chmod 755 /usr/local/bin/boot \
 && boot -u \
 && curl -fsSLo /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
 && chmod 755 /usr/local/bin/lein \
 && lein upgrade

WORKDIR /root

CMD ["/bin/bash", "-c", "exec sleep infinity"]
