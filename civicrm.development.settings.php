<?php
/**
 * CiviCRM settigns for development environment
 *
 * These are based on staging, which in turn is based on production
 * settings.
 */
require_once("civicrm.staging.settings.php");

$civicrm_setting['CiviCRM Preferences']['enableSSL'] = 0;

# <https://docs.civicrm.org/dev/en/latest/tools/debugging/>
//define('CIVICRM_DEBUG_LOG_QUERY', 1); 
define('CIVICRM_DEBUG_LOG_QUERY', 'backtrace'); 
define('CIVICRM_DAO_DEBUG', 1);
//define('CIVICRM_CONTAINER_CACHE', 'never');