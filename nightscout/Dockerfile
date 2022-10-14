ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN mkdir -p /opt/app
COPY . /opt
WORKDIR /opt/app

ARG BUILD_ARCH=amd64
ARG NIGHTSCOUT_VERSION=14.2.2
# hadolint ignore=DL3008
RUN \
    URL="http://archive.ubuntu.com/ubuntu/" \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then \
        URL="http://ports.ubuntu.com/ubuntu-ports/"; \
    fi \
    && echo "deb ${URL} bionic universe" \
        > /etc/apt/sources.list.d/bionic-universe.list \
    \
    && echo "deb ${URL} bionic main" \
        > /etc/apt/sources.list.d/bionic-main.list \
    \
    && curl -sL "https://deb.nodesource.com/setup_14.x" | bash - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        mongodb-server=1:3.6.3-0ubuntu1.4 \
        nodejs \
        git \
        webpack \
        build-essential \
        python2.7 \
        nginx \
        libnginx-mod-http-lua \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    && git clone --depth 1 --branch ${NIGHTSCOUT_VERSION} https://github.com/nightscout/cgm-remote-monitor.git /opt/app \
    \
    && npm install \
    && npm run postinstall \
    && npm run env \
    && npm audit fix

VOLUME ["/data/db"]

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Nightscout" \
    io.hass.description="Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Marcio Granzotto <oscensores@gmail.com>" \
    org.opencontainers.image.title="Nightscout" \
    org.opencontainers.image.description="Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime." \
    org.opencontainers.image.vendor="Marcio Granzotto" \
    org.opencontainers.image.authors="Marcio Granzotto <oscensores@gmail.com>" \
    org.opencontainers.image.licenses="GNUv3" \
    org.opencontainers.image.source="https://github.com/loopy321/addon-nightscout" \
    org.opencontainers.image.documentation="https://github.com/loopy321/addon-nightscout/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
