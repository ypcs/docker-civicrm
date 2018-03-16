<?php
/**
 * CiviCRM settigns for production environment
 *
 * Settings for staging are based on these.
 */

$civicrm_setting['Developer Preferences']['userFrameworkLogging'] = 1;
$civicrm_setting['Developer Preferences']['debug_enabled'] = 0;
$civicrm_setting['Developer Preferences']['backtrace'] = 0;

//$civicrm_setting['Localization Preferences']['lcMessages'] = 'fi_FI';
//$civicrm_setting['Localization Preferences']['inheritLocale'] = 1;
//$civicrm_setting['Localization Preferences']['contact_default_language'] = 'fi_FI';
$civicrm_setting['Localization Preferences']['defaultCurrency'] = 'EUR';
$civicrm_setting['Localization Preferences']['monetaryThousandSeparator'] = ' ';
$civicrm_setting['Localization Preferences']['monetaryDecimalPoint'] = ',';
//$civicrm_setting['Localization Preferences']['languageLimit'] = array('fi_FI', 'sv_SE', 'en_US');
//$civicrm_setting['Localization Preferences']['defaultContactCountry'] = '';

$civicrm_setting['CiviCRM Preferences']['userFrameworkUsersTableName'] = 'users';
$civicrm_setting['CiviCRM Preferences']['syncCMSEmail'] = 1;
$civicrm_setting['Developer Preferences']['assetCache'] = 'auto';

//$civicrm_setting['Directory Preferences']['uploadDir'] = NULL;
//$civicrm_setting['Directory Preferences']['imageUploadDir'] = NULL;
//$civicrm_setting['Directory Preferences']['customFileUploadDir'] = NULL;
//$civicrm_setting['Directory Preferences']['customTemplateDir'] = NULL;
//$civicrm_setting['Directory Preferences']['customPHPPathDir'] = NULL;
//$civicrm_setting['Directory Preferences']['extensionsDir'] = NULL;
$civicrm_setting['CiviCRM Preferences']['checksum_timeout'] = 7;
$civicrm_setting['CiviCRM Preferences']['contact_undelete'] = 1;
$civicrm_setting['CiviCRM Preferences']['logging'] = 1;
$civicrm_setting['CiviCRM Preferences']['recaptchaOptions'] = NULL;
$civicrm_setting['CiviCRM Preferences']['recaptchaPublicKey'] = NULL;
$civicrm_setting['CiviCRM Preferences']['recaptchaPrivateKey'] = NULL;
$civicrm_setting['CiviCRM Preferences']['max_attachments'] = 3;
$civicrm_setting['CiviCRM Preferences']['maxFileSize'] = 3;
$civicrm_setting['CiviCRM Preferences']['allowPermDeleteFinancial'] = 0;
$civicrm_setting['CiviCRM Preferences']['securityAlert'] = 1;
$civicrm_setting['CiviCRM Preferences']['doNotAttachPDFReceipt'] = 1;
$civicrm_setting['CiviCRM Preferences']['recordGeneratedLetters'] = 1;
$civicrm_setting['CiviCRM Preferences']['wkhtmltopdfPath'] = NULL;

$civicrm_setting['URL Preferences']['userFrameworkResourceURL'] = NULL;
$civicrm_setting['URL Preferences']['imageUploadURL'] = NULL;
$civicrm_setting['URL Preferences']['customCSSURL'] = NULL;
$civicrm_setting['URL Preferences']['extensionsURL'] = NULL;

$civicrm_setting['CiviCRM Preferences']['verifySSL'] = 1;
$civicrm_setting['CiviCRM Preferences']['enableSSL'] = 1;
$civicrm_setting['CiviCRM Preferences']['secondDegRelPermissions'] = 0;

// Disable downloading extensions
// $civicrm_setting['Extension Preferences']['ext_repo_url'] = false;

// Disable dashboard community messages
$civicrm_setting['CiviCRM Preferences']['communityMessagesUrl'] = false;
