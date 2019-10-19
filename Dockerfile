FROM licensefinder/license_finder

RUN mkdir -p /var/license_action/
WORKDIR /var/license_action/
COPY script.sh script.sh

ENTRYPOINT ["bash", "-lc", "/var/license_action/script.sh"]

