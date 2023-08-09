FROM scratch

COPY cache/frps /bin/frps
ENTRYPOINT ["/bin/frps"]

LABEL org.opencontainers.image.title="frps" \
  org.opencontainers.image.authors="mebtte<hi@mebtte.com>" \
  org.opencontainers.image.url="https://github.com/mebtte/docker"
