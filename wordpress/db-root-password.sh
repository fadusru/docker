#!/usr/bin/env bash
# Найдем в логах работы контейнера пароль пользователя root
docker compose logs | grep 'GENERATED ROOT PASSWORD'