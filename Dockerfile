ARG BUILD_FROM
FROM $BUILD_FROM

LABEL io.hass.version="1.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Setup base
# hadolint ignore=DL3018
RUN apk add --no-cache \
    nano \
    sane \
    sane-saned \
    sane-utils \
  && apk add  --no-cache $(apk search -q sane-backend-) \
  && apk del sane-backend-net sane-backend-test sane-backend-gphoto2

# Copy root filesystem
COPY rootfs /

RUN chmod a+x /run.sh

CMD ["/run.sh"]
