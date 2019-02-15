FROM node:11.9.0-alpine as dev
LABEL maintainer="Ben Saufley <contact@bensaufley.com>"
RUN adduser -D -u 1002 scratchuser

ENV NODE_ENV development
ENV BABEL_CACHE_PATH=/tmp/.cache/babel-cache.json

WORKDIR /tmp

RUN mkdir /tmp/.cache && chown -R scratchuser /tmp/.cache

COPY package.json yarn.lock /tmp/
RUN mkdir -p node_modules/.cache && chown -R scratchuser node_modules
RUN yarn install
RUN mkdir -p /usr/src/babelts-starter && cp -a /tmp/node_modules /usr/src/babelts-starter

RUN mkdir /usr/src/babelts-starter/.build && chown -R scratchuser /usr/src/babelts-starter/.build
VOLUME [ "/usr/src/babelts-starter/.build" ]

WORKDIR /usr/src/babelts-starter
COPY . /usr/src/babelts-starter

USER scratchuser

FROM node:11.9.0-alpine as test
LABEL maintainer="Ben Saufley <contact@bensaufley.com>"

WORKDIR /usr/src/babelts-starter
COPY --from=dev /usr/src/babelts-starter .

RUN [ "yarn", "test" ]
