#!/bin/bash
set -e

OPENSSL_INSTALLED=false

if which openssl >/dev/null
then 
  OPENSSL_INSTALLED=true
fi

## certificate parameters
COUNTRY_NAME="US"
STATE_NAME="New Mexico"
LOCALITY_NAME="Roswell"
ORGANIZATION_NAME="ACME Co, LLC."
ORGANIZATIONAL_UNIT_NAME="ACME Department"
COMMON_NAME="www.domain.com"
EMAIL_ADDRESS="email@domain"

## apache or nginx
SERVER_KEY="apache-selfsigned.key"
SERVER_KEY_PATH="/etc/ssl/private"
SERVER_CRT="apache-selfsigned.crt"
SERVER_CRT_PATH="/etc/ssl/certs"

OPENSSL_SUBJ_OPTIONS="
Country Name (2 letter code) [AU]:$COUNTRY_NAME
State or Province Name (full name) [Some-State]:$STATE_NAME
Locality Name (eg, city) []:$LOCALITY_NAME
Organization Name (eg, company) [Internet Widgits Pty Ltd]:$ORGANIZATION_NAME
Organizational Unit Name (eg, section) []:$ORGANIZATIONAL_UNIT_NAME
Common Name (e.g. server FQDN or YOUR name) []:$COMMON_NAME
Email Address []:$EMAIL_ADDRESS
"

if [ "$OPENSSL_INSTALLED" = true ]
then 
    echo "generating self signed certificate"
    echo "with these options: "
    echo "$OPENSSL_SUBJ_OPTIONS"
    echo ""

    ## generate self signed certificate
    openssl req \
        -new \
        -newkey rsa:4096 \
        -days 365 \
        -nodes \
        -x509 \
        -subj "/emailAddress=$EMAIL_ADDRESS/C=$COUNTRY_NAME/ST=$STATE_NAME/L=$LOCALITY_NAME/O=$ORGANIZATION_NAME/OU=$ORGANIZATIONAL_UNIT_NAME/CN=$COMMON_NAME" \
        -keyout $SERVER_KEY \
        -out $SERVER_CRT
    
    ## uncomment: move to correct location
    #mv -f $SERVER_KEY $SERVER_KEY_PATH/$SERVER_KEY
    #mv -f $SERVER_CRT $SERVER_CRT_PATH/$SERVER_CRT
else
    echo "openssl is not installed"
    exit 1
fi

#end