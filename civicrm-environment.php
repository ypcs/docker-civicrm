<?php
/**
 * Return CiviCRM environment
 **/
if (!function_exists('civicrm_environment')) {
    function civicrm_environment() {
        $env = strtolower(basename(trim(getenv('CIVICRM_ENVIRONMENT'))));
        if (strlen($env) == 0) {
            $env = 'production';
        }
        switch ($env) {
            case 'production':
                break;
            case 'development':
                break;
            case 'staging':
                break;
            default:
                die('Invalid environment!');
                break;
        }
        return $env;
    }
}
if (!function_exists('civicrm_environment_settings')) {
    function civicrm_environment_settings() {
        $settings_file = dirname(__FILE__) . '/civicrm.' . civicrm_environment() . '.settings.php';
        if (file_exists($settings_file)) {
            require_once($settings_file);
        }
    }
}

if (!defined('CIVICRM_ENVIRONMENT') && function_exists('civicrm_environment')) {
    define('CIVICRM_ENVIRONMENT', civicrm_environment());
} else if (!defined('CIVICRM_ENVIRONMENT')) {
    die('Missing CIVICRM_ENVIRONMENT!');
}
$civicrm_setting['Developer Preferences']['environment'] = CIVICRM_ENVIRONMENT;
