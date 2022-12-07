# Init a git repository
git init

# Add your files
git add .

# Create the first commit
git commit -m "clever init"

# Deploy the application
clever deploy --alias keycloak-server

# Open Keycloak in your browser
clever open --alias keycloak-server
