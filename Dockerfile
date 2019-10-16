FROM ruby:2.6-alpine

RUN apk add build-base binutils git openssh-client

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["script.sh"]

