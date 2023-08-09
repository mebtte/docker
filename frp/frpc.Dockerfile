FROM scratch

COPY cache/frpc /bin/frpc
ENTRYPOINT ["/bin/frpc"]

LABEL org.opencontainers.image.title="frpc" \
  org.opencontainers.image.authors="mebtte<hi@mebtte.com>" \
  org.opencontainers.image.url="https://github.com/mebtte/docker"
