#!/usr/bin/env bash
# Ошибка Permission denied при запуске контейнера Nexus (sonatype/nexus3) на TerraMaster Docker возникает из-за того,
# что процесс внутри контейнера работает под системным пользователем с ID 200, а у примонтированной папки на вашем NAS
# нет прав на запись для этого пользователя
chown -R 200:200 /Volume1/DockerAppData/nexus3

# Пример вывода в Терминал у меня. Заменил информацию о моем локальном пользователе на NAS
# user@f6:/# chown -R 200:200 /Volume1/DockerAppData/nexus3
# user@f6:/# ls /Volume1/DockerAppData/nexus3 -la
# total 4
# drwxr-xr-x+ 1        200        200  58 Aug 25 21:59 .
# drwxr-xr-x+ 1 user user  70 Aug 25 21:14 ..
# -rwxr-xr-x+ 1        200        200 398 Aug 25 21:55 docker-compose.yaml
# drwxr-xr-x+ 1        200        200   0 Aug 25 21:33 nexus-data