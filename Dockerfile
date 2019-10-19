FROM licensefinder/license_finder

RUN mkdir -p /var/license_action/
WORKDIR /var/license_action/
COPY script.sh script.sh

ENTRYPOINT ["/var/license_action/script.sh"]

