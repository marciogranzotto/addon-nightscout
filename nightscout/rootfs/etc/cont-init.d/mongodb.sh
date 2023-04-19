#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: NightScout
# Configures MongoDB
# ==============================================================================

# Ensures the data of the DB is store outside the container
if ! bashio::fs.directory_exists '/data/nightscout/mongodb'; then
    mkdir -p /data/nightscout/mongodb
fi
rm -fr /var/lib/mongodb
ln -s /data/nightscout/mongodb /var/lib/mongodb
chown -R mongodb:mongodb /var/lib/mongodb
chown -R mongodb:mongodb /data/nightscout/mongodb