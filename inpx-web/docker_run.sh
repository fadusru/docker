#!/usr/bin/env bash
# Скачаем и запустим собранную версию на Docker Hub
docker run -d --name inpx-web \
    --restart always \
    -v /opt/inpx-web:/usr/local/bin/.inpx-web \
    -v /opt/flibusta:/data/flibusta \
    -e INPX=/data/flibusta/flibusta_fb2_local.inpx \
    -e LIBDIR=/data/flibusta/ \
    -p 12380:12380 \
    guaricema/inpx-web