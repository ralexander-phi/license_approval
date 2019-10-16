FROM ruby:2.6-alpine

COPY Gemfile /Gemfile
RUN bundle install --system --gemfile /Gemfile

COPY script.sh /script.sh

ENTRYPOINT ["/script.sh"]

