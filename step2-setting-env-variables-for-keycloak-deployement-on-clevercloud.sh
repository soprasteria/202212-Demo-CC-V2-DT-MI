#!/bin/sh

# Export env for templating purpose
export $(clever env --alias keycloak-server | sed '/^#/d;s/\"//g')

clever env set CC_JAR_PATH lib/quarkus-run.jar --alias keycloak-server
clever env set CC_JAVA_VERSION 11 --alias keycloak-server
clever env set CC_RUN_COMMAND "bin/kc.sh start --auto-build" --alias keycloak-server

clever env set KC_DB postgres --alias keycloak-server
clever env set KC_DB_USERNAME $POSTGRESQL_ADDON_USER --alias keycloak-server
clever env set KC_DB_PASSWORD $POSTGRESQL_ADDON_PASSWORD --alias keycloak-server
clever env set KC_DB_URL "jdbc:postgresql://$POSTGRESQL_ADDON_HOST:$POSTGRESQL_ADDON_PORT/$POSTGRESQL_ADDON_DB" --alias keycloak-server
clever env set KC_HOSTNAME $KEYCLOAK_DOMAIN --alias keycloak-server
clever env set KC_HTTP_ENABLED true --alias keycloak-server
clever env set KC_PROXY passthrough --alias keycloak-server
clever env set KC_PROXY_ADDRESS_FORWARDING true --alias keycloak-server
