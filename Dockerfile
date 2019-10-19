FROM ruby:2.6-buster

# Some basic tools we may need for building
RUN apt install git -y

# Install license_finder
RUN mkdir -p /var/license_action/
WORKDIR /var/license_action/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --system

COPY script.sh script.sh

ENTRYPOINT ["/var/license_action/script.sh"]

