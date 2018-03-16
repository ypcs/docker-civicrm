#!/bin/sh
set -e

[ -z "${CIVICRM_DATABASE_HOST}" ] && echo "Missing CIVICRM_DATABASE_HOST!" && exit 1
[ -z "${CIVICRM_DATABASE_USER}" ] && echo "Missing CIVICRM_DATABASE_USER!" && exit 1
[ -z "${CIVICRM_DATABASE_PASSWORD}" ] && echo "Missing CIVICRM_DATABASE_PASSWORD!" && exit 1
[ -z "${CIVICRM_DATABASE_NAME}" ] && echo "Missing CIVICRM_DATABASE_NAME!" && exit 1
[ -z "${CIVICRM_INSTALL_URL}" ] && echo "Missing CIVICRM_INSTALL_URL!" && exit 1

[ -z "${DRUPAL_USERNAME}" ] && echo "Missing DRUPAL_USERNAME!" && exit 1
[ -z "${DRUPAL_PASSWORD}" ] && echo "Missing DRUPAL_PASSWORD!" && exit 1
[ -z "${DRUPAL_LOGIN_URL}" ] && echo "Missing DRUPAL_LOGIN_URL!" && exit 1

[ -z "${DRUPAL_DATABASE_HOST}" ] && echo "Missing DRUPAL_DATABASE_HOST!" && exit 1
[ -z "${DRUPAL_DATABASE_USER}" ] && echo "Missing DRUPAL_DATABASE_USER!" && exit 1
[ -z "${DRUPAL_DATABASE_PASSWORD}" ] && echo "Missing DRUPAL_DATABASE_PASSWORD!" && exit 1
[ -z "${DRUPAL_DATABASE_NAME}" ] && echo "Missing DRUPAL_DATABASE_NAME!" && exit 1

TEMPFILE="$(mktemp)"

echo "Login to Drupal"
curl \
    --cookie-jar "${TEMPFILE}" \
    -X POST \
    -F "name=${DRUPAL_USERNAME}" \
    -F "pass=${DRUPAL_PASSWORD}" \
    -F "form_id=user_login" \
    -F "op=Log in" \
    "${DRUPAL_LOGIN_URL}"

echo "Submit CiviCRM install request"
curl \
    --cookie "${TEMPFILE}" \
    -X POST \
    -F "mysql[server]=${CIVICRM_DATABASE_HOST}" \
    -F "mysql[username]=${CIVICRM_DATABASE_USER}" \
    -F "mysql[password]=${CIVICRM_DATABASE_PASSWORD}" \
    -F "mysql[database]=${CIVICRM_DATABASE_NAME}" \
    -F "drupal[server]=${DRUPAL_DATABASE_HOST}" \
    -F "drupal[username]=${DRUPAL_DATABASE_USER}" \
    -F "drupal[password]=${DRUPAL_DATABASE_PASSWORD}" \
    -F "drupal[database]=${DRUPAL_DATABASE_NAME}" \
    -F "go=1" \
    -F "seedLanguage=en_US" \
    -F "loadGenerated=0" \
    "${CIVICRM_INSTALL_URL}"

# force_reinstall=1

rm -f "${TEMPFILE}"
