FROM node:14.17.0-alpine

LABEL maintainer="We ahead AB <all@weahead.se>"

ENV DOCKER_DRIVER=overlay2

RUN apk --no-cache add \
      curl \
      git \
      jq \
      openssl \
      docker \
      docker-compose

ENV NOW_VERSION=15.3.0

RUN npm install -g --unsafe-perm --silent now@${NOW_VERSION}

COPY --from=rancher/cli:v0.6.10 /usr/bin/rancher /usr/local/bin/rancher
