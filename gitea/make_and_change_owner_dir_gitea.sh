#!/usr/bin/env bash
# Замените путь к директории gitea на свой
mkdir /Volume1/DockerAppData/gitea

# В имидже хард-код, нужно сменить владельца и группу на 1000
# Да, знаю, что в TOS 7 пользователь с UID=1000 и GID=1000 существует - это vbox
chown -R 1000:1000 /Volume1/DockerAppData/gitea