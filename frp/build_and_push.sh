#!/usr/bin/env bash

docker pull mebtte/frps
current_version=$(docker run --rm mebtte/frps frps -v)

latest_desc=$(gh release list --repo fatedier/frp -L 50 --exclude-drafts --exclude-pre-releases | grep -i latest)
latest_version=$(node -e "console.log('$latest_desc'.split(/\s/)[0].replace('v',''))")

if [ $current_version != $latest_version ]; then
  cd frp

  mkdir -p cache
  gh release download v$latest_version -D cache -p '*linux_386*' --repo fatedier/frp --skip-existing
  tar -zxvf cache/frp_${latest_version}_linux_386.tar.gz -C cache

  mv cache/frp_${latest_version}_linux_386/frps cache
  docker buildx build -t mebtte/frps -f frps.Dockerfile --push .

  mv cache/frp_${latest_version}_linux_386/frpc cache
  docker buildx build -t mebtte/frpc -f frpc.Dockerfile --push .

  # update readme
  sed -i "5s|.*|> Current frp version inside image is [v$latest_version](https://github.com/fatedier/frp/releases/tag/v$latest_version).|" frp/readme.md
  git config --local user.name mebtte
  git config --local user.email hi@mebtte.com
  git remote add origin https://$GITHUB_TOKEN@github.com/mebtte/docker-images.git
  git add readme.md
  git commit -m "update frp readme"
  git push origin master
fi
