<?php
/**
 * CiviCRM settigns for production environment
 *
 * These are based on production settings, and settings for
 * development are based on these.
 */
require_once("civicrm.production.settings.php");

$civicrm_setting['Developer Preferences']['userFrameworkLogging'] = 1;
$civicrm_setting['Developer Preferences']['debug_enabled'] = 1;
$civicrm_setting['Developer Preferences']['backtrace'] = 1;

define('CIVICRM_MAIL_LOG', 1);