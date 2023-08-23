# http-server

A docker image for [http-server](https://github.com/http-party/http-server). There is a [github action](https://github.com/mebtte/docker/actions/workflows/http-server.yaml) to check updates and rebuild image if updates exist weekly. For more information, please see [here](https://github.com/mebtte/docker).

## Usage

You can refer on [http-server documentation](https://github.com/http-party/http-server#readme).

```sh
docker run \
  -d \
  --restart always \
  -v /path/data:/data:ro \
  -p 80:8080 \
  --name http-server \
  mebtte/http-server \
  /data -p 8080 --gzip
```

You can specify user by `--user uid:gid`. Also you can use docker compose like below:

```yml
services:
  http-server:
    restart: always
    container_name: http-server
    # user: 1000:1000
    image: mebtte/http-server
    ports:
      - 80:8080
    volumes:
      - /path/data:/data:ro
    command: /data -p 8080 --gzip
```
