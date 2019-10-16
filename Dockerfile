FROM ruby:2.6-alpine

COPY Gemfile.lock /Gemfile.lock
RUN bundle install --system --gemfile /Gemfile.lock

COPY script.sh /script.sh

ENTRYPOINT ["/script.sh"]

