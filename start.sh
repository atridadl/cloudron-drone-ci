#!/bin/bash
set -eu

# ensure that data directory is owned by 'cloudron' user
chown -R cloudron:cloudron /app/data

echo "==> Starting Drone CI"
cd /app/data

sed -i "s%.*DRONE_DATABASE_DATASOURCE.*%DRONE_DATABASE_DATASOURCE=$CLOUDRON_POSTGRESQL_URL?sslmode=disable%g" /app/data/.env
sed -i "s%.*DRONE_SERVER_HOST.*%DRONE_SERVER_HOST=$CLOUDRON_APP_DOMAIN%g" /app/data/.env

exec /usr/local/bin/gosu cloudron:cloudron /app/code/drone-server -env-file /app/code/.env
