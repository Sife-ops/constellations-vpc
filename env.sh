#!/bin/sh

err() {
    echo 'Error: environment variables'
}

if ! stat ./.env 1>/dev/null 2>&1 ; then err ; exit 1 ; fi

. ./.env

if [ -z $CERTBOT_DOMAIN ] ; then err ; exit 1 ; fi
if [ -z $CERTBOT_EMAIL ] ; then err ; exit 1 ; fi

if [ -z $CAPTCHA_SECRET ] ; then err ; exit 1 ; fi
if [ -z $SECRET_ACCESS_TOKEN ] ; then err ; exit 1 ; fi
if [ -z $VITE_PROD_URL ] ; then err ; exit 1 ; fi
if [ -z $VITE_RECAPTCHA_KEY ] ; then err ; exit 1 ; fi

