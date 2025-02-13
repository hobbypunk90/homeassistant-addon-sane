#!/usr/bin/with-contenv bashio

ulimit -n 1048576

bashio::log.info "Preparing directories"
if [ ! -d /config/sane.d ]; then cp -v -R /etc/sane.d /config/sane.d; fi
rm -v -fR /etc/sane.d

ln -v -s /config/sane.d /etc/sane.d

bashio::log.info "Starting SANEd server as CMD from S6"

saned -l --user=root
