FROM ruby:2.6-alpine

#RUN apk add build-base binutils git openssh-client

RUN gem install license_finder

COPY script.sh /script.sh

ENTRYPOINT ["/script.sh"]

