FROM node:8.12.0-alpine

ENV DOCKER_DRIVER=overlay2

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk --no-cache add \
      git \
      jq \
      openssl \
      docker \
      docker-compose

COPY --from=rancher/cli:v0.6.10 /usr/bin/rancher /usr/local/bin/rancher

