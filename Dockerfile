FROM ypcs/drupal:latest

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_DSN mysql://civicrm:civicrm@db/civicrm
ENV CIVICRM_URL http://civicrm/

ENV CIVICRM_VERSION 5.12.1
ENV CIVICRM_SHA256 8ea4d6fd5d8b0fb24febf7081e951c00a7d13094a8c4844b5cb5805396eedd47
ENV CIVICRM_L10N_SHA256 d0f0a90c25d392d8736c98d295bb087d41badd2b00c32dbde7d037a990744adb

ENV CIVICRM_CV_SHA256 a6fe7f9eecbcbfd3af23db0d6b354534dcecd661719610daccb2cd066a13c1fa
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
