#!/usr/bin/env bash
# добавил монтирование ./calibre-data для загрузки книг через файловый ресурс
# можно каталог ./calibre-data использовать для хранения библиотеки
# lscr.io/linuxserver/calibre:latest
# удалил параметры:
# --security-opt seccomp=unconfined `#optional` \
#   -e CLI_ARGS= `#optional` \

docker run -d \
  --name=calibre \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Moskow \
  -e CUSTOM_USER="abc" \
  -e PASSWORD="abc" \
  -p 8080:8080 \
  -p 8181:8181 \
  -p 8081:8081 \
  -v $(pwd)/calibre-config:/config \
  -v $(pwd)/calibre-library:/config/Calibre Library \
  --shm-size="1gb" \
  --restart unless-stopped \
  linuxserver/calibre:latest