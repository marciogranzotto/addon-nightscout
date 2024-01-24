#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Nightscout
# Configures Nightscout
# ==============================================================================

readonly api_key=$(bashio::config 'api_key')
readonly mongodb_uri=$(bashio::config 'mongodb_uri')

bashio::log.info "Setting up API KEY: ${api_key}"
export API_SECRET="${api_key}"
bashio::log.info "Using Mongo URI: ${mongodb_uri}"
export MONGODB_URI="${mongodb_uri}"
export CONNECT_SOURCE="${connect_source}"
export CONNECT_LINK_UP_USERNAME="${connect_link_up_username}"
export CONNECT_LINK_UP_PASSWORD="${connect_link_up_password}"
