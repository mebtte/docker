FROM ubuntu

COPY cache/frps /usr/bin/
VOLUME [ "/config" ]
CMD frps -c /config/frps.ini

LABEL org.opencontainers.image.title="cicada" \
  org.opencontainers.image.authors="mebtte<hi@mebtte.com>" \
  org.opencontainers.image.url="https://github.com/mebtte/docker-images"
