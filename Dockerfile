FROM ypcs/civicrm:latest
ENV DOCUMENT_ROOT /var/www

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        git \
        mkdocs \
        mkdocs-bootstrap \
        nodejs \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-xdebug \
        unzip \
        zip && \
    update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 && \
    /usr/local/sbin/docker-cleanup

COPY php-xdebug.ini /etc/php/${PHP_VERSION}/fpm/conf.d/99-xdebug.ini

RUN \
    echo "TODO: install drupal"

RUN \
    echo "TODO: clone civicrm repository?"

RUN \
    echo "TODO: clone other civicrm docs, w/o shallow?"

RUN \
    mkdir -p /usr/local/share/doc && \
    git clone --depth=1 https://github.com/civicrm/civicrm-sysadmin-guide /usr/local/share/doc/civicrm-sysadmin-guide

RUN \
    mkdir -p /usr/local/share && \
    git clone --depth=1 https://github.com/civicrm/civicrm-buildkit /usr/local/share/civicrm-buildkit

RUN \
    /usr/local/share/civicrm-buildkit/bin/civi-download-tools
