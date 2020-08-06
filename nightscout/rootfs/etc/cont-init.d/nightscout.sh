#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Nightscout
# Configures Nightscout
# ==============================================================================

readonly api_key=$(bashio::config 'api_key')

bashio::log.info "Setting up API KEY: ${api_key}"
export API_SECRET="${api_key}"
