#!/bin/bash

echo "Configuring config.json..."

export XMPP_NAME="$(echo ${XMPP_NAME} | sed 's/\//\\\//g')"
export XMPP_DOMAIN="$(echo ${XMPP_DOMAIN} | sed 's/\//\\\//g')"
export XMPP_WSS="$(echo ${XMPP_WSS} | sed 's/\//\\\//g')"
export XMPP_MUC="$(echo ${XMPP_MUC} | sed 's/\//\\\//g')"
export XMPP_STARTUP="$(echo ${XMPP_STARTUP} | sed 's/\//\\\//g')"
export XMPP_ADMIN="$(echo ${XMPP_ADMIN} | sed 's/\//\\\//g')"

sed 's/{{HOSTNAME}}/'"${HOSTNAME}"'/' -i /app/config/config.json

sed 's/{{XMPP_NAME}}/'"${XMPP_NAME}"'/' -i /app/config/config.json
sed 's/{{XMPP_DOMAIN}}/'"${XMPP_DOMAIN}"'/' -i /app/config/config.json
sed 's/{{XMPP_WSS}}/'"${XMPP_WSS}"'/' -i /app/config/config.json
sed 's/{{XMPP_MUC}}/'"${XMPP_MUC}"'/' -i /app/config/config.json
sed 's/{{XMPP_STARTUP}}/'"${XMPP_STARTUP}"'/' -i /app/config/config.json
sed 's/{{XMPP_ADMIN}}/'"${XMPP_ADMIN}"'/' -i /app/config/config.json

cp /app/config/dev_config.json /kaiwa

echo "Configuring kaiwa..."

cd kaiwa

npm start
