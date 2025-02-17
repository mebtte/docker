# frp

A docker image for [frp](https://github.com/fatedier/frp) including frps and frpc. There is a [github action](https://github.com/mebtte/docker/actions/workflows/frp.yaml) to check updates and rebuild image if updates exist weekly. For more information, please see [here](https://github.com/mebtte/docker).

## Usage

You can refer on [frp documentation](https://gofrp.org/docs).

### frps

```sh
docker run \
  -d \
  --network host \
  --restart always \
  -v /path/frps.toml:/config/frps.toml \
  --name frps \
  mebtte/frps \
  -c /config/frps.toml
```

You can specify user by `--user uid:gid`. Also you can use docker compose like below:

```yml
services:
  frps:
    restart: always
    container_name: frps
    # user: 1000:1000
    image: mebtte/frps
    network_mode: host
    volumes:
      - /path/config.toml:/config/frps.toml:ro
    command: -c /config/frps.toml
```

### frpc

```sh
docker run \
  -d \
  --network host \
  --restart always \
  -v /path/frpc.toml:/config/frpc.toml \
  --name frpc \
  mebtte/frpc \
  -c /config/frpc.toml
```

You can specity user using `--user uid:gid`. Also you can use docker compose like below:

```yml
services:
  frpc:
    restart: unless-stopped
    container_name: frpc
    # user: 1000:1000
    image: mebtte/frpc
    network_mode: host
    volumes:
      - /path/config.toml:/config/frpc.toml:ro
    command: -c /config/frpc.toml
```
