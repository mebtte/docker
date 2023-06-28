FROM ubuntu

COPY cache/frpc /usr/bin/
VOLUME [ "/config" ]
CMD frpc -c /config/frpc.ini

LABEL org.opencontainers.image.title="cicada" \
  org.opencontainers.image.authors="mebtte<hi@mebtte.com>" \
  org.opencontainers.image.url="https://github.com/mebtte/docker-images"
