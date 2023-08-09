# frp

A docker image for [frp](https://github.com/fatedier/frp) including frps and frpc. There is a [github action](https://github.com/mebtte/docker/actions/workflows/frp.yaml) to check frp update and rebuild image if update exist weekly. For more information, please see [here](https://github.com/mebtte/docker).

The version of frp inside image is [v0.51.2](https://github.com/fatedier/frp/releases/tag/v0.51.2).

## Usage

### frps

```sh
docker run \
  -d \
  --network host \
  --restart always \
  -v /path/frps.ini:/config/frps.ini \
  --name frps \
  mebtte/frps
  -c /config/frps.ini
```

You can specity user using `--user uid:gid`.

### frpc

```sh
docker run \
  -d \
  --network host \
  --restart always \
  -v /path/frpc.ini:/config/frpc.ini \
  --name frpc \
  mebtte/frpc
  -c /config/frpc.ini
```

You can specity user using `--user uid:gid`.
