FROM ruby:2.6-alpine

RUN apk add build-base binutils git openssh-client

WORKDIR /usr/src/app

COPY . .

RUN echo "$GITHUB_WORKSPACE"

RUN bundle

RUN gem install license_finder

CMD ["license_finder"]

