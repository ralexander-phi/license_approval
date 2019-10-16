FROM ruby:2.6-alpine

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --system

COPY script.sh /script.sh

ENTRYPOINT ["/script.sh"]

