#!/bin/sh

# Export env for templating purpose
export $(clever env | sed '/^#/d;s/\"//g')

clever env set CC_JAR_PATH lib/quarkus-run.jar
clever env set CC_JAVA_VERSION 11
clever env set CC_RUN_COMMAND "bin/kc.sh start --auto-build"

clever env set KC_DB postgres
clever env set KC_DB_USERNAME $POSTGRESQL_ADDON_USER
clever env set KC_DB_PASSWORD $POSTGRESQL_ADDON_PASSWORD
clever env set KC_DB_URL "jdbc:postgresql://$POSTGRESQL_ADDON_HOST:$POSTGRESQL_ADDON_PORT/$POSTGRESQL_ADDON_DB"
clever env set KC_HOSTNAME $KEYCLOAK_DOMAIN
clever env set KC_HTTP_ENABLED true
clever env set KC_PROXY passthrough
clever env set KC_PROXY_ADDRESS_FORWARDING true
