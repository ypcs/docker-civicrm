FROM ypcs/drupal:7

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_USER civicrm
ENV CIVICRM_DATABASE_PASSWORD civicrm
ENV CIVICRM_DATABASE_HOST civicrm
ENV CIVICRM_DATABASE_NAME civicrm

ENV CIVICRM_VERSION 4.6.36
ENV CIVICRM_SHA256 fc741c18a14bd9057c6a5f2e9f9e65e6d61fc53108f937dc96cf9a1c090ec88c
ENV CIVICRM_L10N_SHA256 22e11d6243cc966032f415e143f8b657f853b92dae8fcfc46e37248940f30a8e

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

COPY *.php /usr/local/share/civicrm/

RUN \
    /usr/local/sbin/civicrm-download /opt/drupal

