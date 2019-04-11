FROM node:10.15.3-alpine

ENV DOCKER_DRIVER=overlay2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add \
      curl \
      git \
      jq \
      openssl \
      docker \
      docker-compose

ENV NOW_VERSION=14.2.3

RUN npm install -g --unsafe-perm --silent now@${NOW_VERSION}

COPY --from=rancher/cli:v0.6.10 /usr/bin/rancher /usr/local/bin/rancher

