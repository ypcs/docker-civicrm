# civicrm


## Misc 

    ENV DRUPAL_DATABASE_DSN mysql://...
    ENV CIVICRM_DATABASE_DSN mysql://...
    RUN /usr/local/sbin/drupal-download /var/www/html
    RUN /usr/local/sbin/civicrm-download /var/www/html
    RUN /usr/local/sbin/drupal-install /var/www/html
    RUN /usr/local/sbin/civicrm-install /var/www/html
    RUN /usr/local/sbin/drupal-permissions /var/www/html

