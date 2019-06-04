FROM node:8.16.0-alpine

ENV DOCKER_DRIVER=overlay2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add \
      curl \
      git \
      jq \
      openssl \
      docker \
      docker-compose

ENV NOW_VERSION=15.3.0

RUN npm install -g --unsafe-perm --silent now@${NOW_VERSION}

COPY --from=rancher/cli:v0.6.10 /usr/bin/rancher /usr/local/bin/rancher
