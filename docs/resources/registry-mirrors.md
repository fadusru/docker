# Добавление зеркал Docker Hub (registry-mirrors) в Linux

Для добавления зеркал Docker Hub (registry-mirrors) в Linux необходимо отредактировать конфигурационный файл 
демона Docker и перезапустить службу.

## Пошаговая инструкция

1. Откройте или создайте файл конфигурации /etc/docker/daemon.json (для обычного запуска от root) 
или ~/.config/docker/daemon.json (для rootless-режима):
```bash
sudo nano /etc/docker/daemon.json
```
2. Добавьте секцию registry-mirrors со списком нужных зеркал (например, GitVerse, Timeweb Cloud или Beget):
```json
{
  "registry-mirrors": [
    "https://dh-mirror.gitverse.ru",
    "https://dockerhub.timeweb.cloud",
    "https://dockerhub1.beget.com",
    "https://mirror.gcr.io"
  ]
}

```
3. Сохраните файл и примените изменения, перезапустив демон Docker:
```bash
sudo systemctl daemon-reload
```
```bash
sudo systemctl reload docker
```

## Популярные зеркала Docker Hub

| Провайдер / Сервис | Адрес зеркала|
| ----------- | ----------- |
| GitVerse (Сбер) | [Ячейка 2](https://dh-mirror.gitverse.ru) |
| Timeweb Cloud | https://dockerhub.timeweb.cloud |
| Beget | [Ячейка 4](https://dockerhub1.beget.com) |
| Google (кэш/зеркало части образов) | https://mirror.gcr.io |