FROM ruby:2.6-alpine

RUN gem install license_finder

COPY script.sh /script.sh

ENTRYPOINT ["/script.sh"]

