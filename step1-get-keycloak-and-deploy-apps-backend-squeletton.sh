# Repository creation and current directory
mkdir repo
cd repo

# Get lastest Keycloak release
wget https://github.com/keycloak/keycloak/releases/download/20.0.1/keycloak-20.0.1.zip

# Extract the archive
unzip keycloak-20.0.1.zip

# Go to the folder
cd keycloak-20.0.1

# Create the jar application
clever create --type jar keycloak-server
clever link keycloak-server
# Create the PG addon
clever addon create postgresql-addon --plan dev --addon-version 11 keycloak-postgres

# Link the addon
clever service link-addon keycloak-postgres
clever env set KEYCLOAK_DOMAIN $(clever domain | xargs)
