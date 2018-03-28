FROM ypcs/drupal:latest

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_USER civicrm
ENV CIVICRM_DATABASE_PASSWORD civicrm
ENV CIVICRM_DATABASE_HOST civicrm
ENV CIVICRM_DATABASE_NAME civicrm

ENV DRUPAL_VERSION 7.x
ENV CIVICRM_VERSION 4.7.31
ENV CIVICRM_SHA256 627748e20f44b8f755ce928434231617836d045fd9d9b73413827762e2755058
ENV CIVICRM_L10N_SHA256 277d4f86573407f81976e4b39ece443fa447ca48606436852e6209e3793aa57b

ENV CIVICRM_INSTALL_URL http://web/sites/all/modules/civicrm/install/index.php

ENV CIVICRM_CV_SHA256 500bcc61900baf59a98eef5c1bdedc4c1559fbd9339413573213ca84a5a3fef5
ENV CIVICRM_CV_URL https://download.civicrm.org/cv/cv.phar

ENV DRUPAL_LOGIN_URL http://web/user/login

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
COPY setup.sh /usr/local/sbin/civicrm-setup

COPY config/*.php /usr/local/share/civicrm/

RUN \
    /usr/local/sbin/civicrm-download /opt/drupal

RUN echo "Source: https://github.com/ypcs/docker-civicrm\nBuild date: $(date --iso-8601=ns)" >/README
