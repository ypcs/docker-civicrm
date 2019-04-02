FROM ypcs/drupal:latest

ENV CIVICRM_ENVIRONMENT production

ENV CIVICRM_DATABASE_DSN mysql://civicrm:civicrm@db/civicrm
ENV CIVICRM_URL http://civicrm/

ENV CIVICRM_VERSION 5.11.0
ENV CIVICRM_SHA256 1bbfedfea114430d6a52e86057ece85f55800bbe2824c774e718dbf2ad3d306b
ENV CIVICRM_L10N_SHA256 a476feaaffd873c97c7672148b9ea7282cfe827f1f7a5d5a2759c0daccfedaef

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
