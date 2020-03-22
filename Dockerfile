FROM ypcs/drupal:latest

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_DSN mysql://civicrm:civicrm@db/civicrm
ENV CIVICRM_URL http://civicrm/

ENV CIVICRM_VERSION 5.23.3
ENV CIVICRM_SHA256 ba54dca7f703013ca96f2a24447b6e8b06ffb9914689b6c514d5b8b3112abb55
ENV CIVICRM_L10N_SHA256 b8777d9abca275085276236160736cf28786d1a136dca2fa9fd548e480cf7a65

ENV CIVICRM_CV_SHA256 7fc787d156427e2497884a927b43fc3a14a88db9858f259ce2824664fc2f7457
ENV CIVICRM_CV_URL https://download.civicrm.org/cv/cv.phar

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF

RUN \
    /usr/lib/docker-helpers/apt-setup && \
    /usr/lib/docker-helpers/apt-upgrade && \
    apt-get --assume-yes install \
        curl \
        mariadb-client && \
    /usr/lib/docker-helpers/apt-cleanup

RUN \
    curl -fSL "${CIVICRM_CV_URL}" -o /usr/local/bin/cv && \
    echo "${CIVICRM_CV_SHA256} /usr/local/bin/cv" |sha256sum -c - && \
    chmod +x /usr/local/bin/cv

COPY download.sh /usr/local/sbin/civicrm-download
COPY install.sh /usr/local/sbin/civicrm-install

COPY config/*.php /usr/local/share/civicrm/

RUN echo "Source: https://github.com/ypcs/docker-civicrm\nBuild date: $(date --iso-8601=ns)" >/README
