# civicrm

If you desire "fully automated installation", you need to provide script in `/docker-entrypoint-init.d` for launching following steps:

 - drush pm download
 - (wait for db)
 - /usr/local/sbin/drupal-setup
 - drush (install mods)
 - /usr/local/sbin/civicrm-install
 - (wait for webserver)
 - /usr/local/sbin/civicrm-setup
 - /usr/local/sbin/drupal-permissions

Of course, this expects that you provide MySQL credentials etc, see ENV variables in `Dockerfile`.
