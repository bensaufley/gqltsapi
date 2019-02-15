FROM node:11.9.0-alpine AS builder
LABEL maintainer="Ben Saufley <contact@bensaufley.com>"

ENV NODE_ENV development

WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn install

ENV NODE_ENV production

WORKDIR /usr/src/gqltsapi
RUN cp -a /tmp/node_modules .
COPY . /usr/src/gqltsapi

RUN yarn build

FROM node:11.9.0-alpine AS prod
LABEL maintainer="Ben Saufley <contact@bensaufley.com>"
RUN adduser -D -u 1002 scratchuser

ENV NODE_ENV production

WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn install --prod

WORKDIR /usr/src/gqltsapi
RUN mv /tmp/node_modules /tmp/package.json /tmp/yarn.lock .
COPY --from=builder /usr/src/gqltsapi/.build/. .

USER scratchuser

EXPOSE 8080

ENTRYPOINT [ "node", "./index.js" ]
