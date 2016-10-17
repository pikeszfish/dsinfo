FROM alpine:3.4

ENV DOCKER_VERSION 1.12.2

RUN apk update && \
    apk fetch procps sysstat dmidecode && \
    apk add procps sysstat dmidecode curl

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-1.12.2.tgz && tar --strip-components=1 -xvzf docker-1.12.2.tgz -C /usr/local/bin
RUN chmod +x /usr/local/bin/docker

ADD https://raw.githubusercontent.com/docker/docker/master/contrib/check-config.sh /check-config.sh
RUN chmod +x /check-config.sh

ADD dsinfo.sh /dsinfo.sh
RUN chmod +x /dsinfo.sh

ENV TAG latest

CMD /dsinfo.sh -b 2>/dev/null
