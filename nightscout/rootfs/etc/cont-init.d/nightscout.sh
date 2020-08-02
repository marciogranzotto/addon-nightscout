#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: NightScout
# Configures NightScout
# ==============================================================================

readonly api_key=$(bashio::config 'api_key')

bashio::log.info "Setting up API KEY: ${api_key}"
export API_SECRET="${api_key}"
