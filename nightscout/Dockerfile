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
    && if [ "${BUILD_ARCH}" = "armv7" ] \
        || [ "${BUILD_ARCH}" = "aarch64" ]; then \
        URL="http://ports.ubuntu.com/ubuntu-ports/"; \
    fi \
    && echo "deb ${URL} xenial universe" \
        > /etc/apt/sources.list.d/xenial-universe.list \
    \
    && echo "deb ${URL} xenial main" \
        > /etc/apt/sources.list.d/xenial-main.list \
    \
    && if [ "${BUILD_ARCH}" = "i386" ]; then \
        NODEURL="https://deb.nodesource.com/setup_8.x" \
        && NODEJS="nodejs=8.17.0-1nodesource1"; \
    else \
        NODEURL="https://deb.nodesource.com/setup_10.x" \
        && NODEJS="nodejs=10.24.0-1nodesource1"; \
    fi \
    && curl -sL $NODEURL | bash - \
    && apt-get update \
    && echo "${NODEJS}" \
    && apt-get install -y --no-install-recommends \
        mongodb-server=1:3.6.3-0ubuntu1.1 \
        "${NODEJS}" \
        git=1:2.17.1-1ubuntu0.8 \
        webpack=3.5.6-2 \
        build-essential=12.4ubuntu1 \
        python2.7=2.7.17-1~18.04ubuntu1.6 \
        nginx=1.14.0-0ubuntu1.7 \
        libnginx-mod-http-lua=1.14.0-0ubuntu1.7 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch ${NIGHTSCOUT_VERSION} git://github.com/nightscout/cgm-remote-monitor.git /opt/app

RUN npm install \
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
    org.opencontainers.image.source="https://github.com/marciogranzotto/addon-nightscout" \
    org.opencontainers.image.documentation="https://github.com/marciogranzotto/addon-nightscout/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}