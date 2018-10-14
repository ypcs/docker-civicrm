FROM ypcs/drupal:latest

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_DSN mysql://civicrm:civicrm@db/civicrm
ENV CIVICRM_URL http://civicrm/

ENV CIVICRM_VERSION 5.6.0
ENV CIVICRM_SHA256 49296d2f785572fbd56292881052bfbb441bcf14683014149135a3e8d0c6451d
ENV CIVICRM_L10N_SHA256 afd0b4ec64a4f7c74c8f07df942280cae6725178b70a64cfc4d5ccfee981a74d

ENV CIVICRM_CV_SHA256 148e5510e020e9f45ffe8aa782364978042f5fafa22adc68d87b506ab8ca289f
ENV CIVICRM_CV_URL https://download.civicrm.org/cv/cv.phar

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF

RUN \
    /usr/local/sbin/docker-upgrade &&\
    apt-get update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install \
        curl \
        mariadb-client && \
    /usr/local/sbin/docker-cleanup

RUN \
    curl -fSL "${CIVICRM_CV_URL}" -o /usr/local/bin/cv && \
    echo "${CIVICRM_CV_SHA256} /usr/local/bin/cv" |sha256sum -c - && \
    chmod +x /usr/local/bin/cv

COPY download.sh /usr/local/sbin/civicrm-download
COPY install.sh /usr/local/sbin/civicrm-install

COPY config/*.php /usr/local/share/civicrm/

RUN echo "Source: https://github.com/ypcs/docker-civicrm\nBuild date: $(date --iso-8601=ns)" >/README
