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

ENV VERCEL_VERSION=22.0.1

RUN yarn global add vercel@${VERCEL_VERSION}

COPY --from=rancher/cli:v0.6.14 /usr/bin/rancher /usr/local/bin/rancher
