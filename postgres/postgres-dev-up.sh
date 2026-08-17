#!/usr/bin/env bash
# Запускаем конфигурацию Postgres для DEV-окружения
# Если хотите посмотреть логи запуска - удалите параметр --detach
docker compose --env-file .env.dev up --detach