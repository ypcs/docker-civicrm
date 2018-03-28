#!/bin/sh
set -e

TARGET="$1"
[ -z "${TARGET}" ] && echo "missing target directory!" && exit 1

[ -z "${CIVICRM_DATABASE_DSN}" ] && echo "missing variable: \$CIVICRM_DATABASE_DSN" && exit 1

cv core:install \
    --db="${CIVICRM_DATABASE_DSN}"
