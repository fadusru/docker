# Gitea

[docs.gitea.com: Установка в Docker](https://docs.gitea.com/installation/install-with-docker/)

[gitea/gitea образ на Docker Hub](https://hub.docker.com/r/gitea/gitea)

[dockerhosting.ru: Запуск Gitea в Docker](https://dockerhosting.ru/blog/gitea-v-docker/)

[gitea docker поиск в Google](https://share.google/KvvImUFAqhzBnhCA6)

[bafista.ru: Git сервер на Synology в docker на базе Gitea](https://bafista.ru/git-server-na-synology-v-docker-na-baze-gitea/)

[интеграция gitea с jenkins](https://yandex.ru/search/?text=%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D1%8F+gitea+%D1%81+jenkins&neuro_dialog_id=shared%2F8914-31f3-6969-25d8)

В имидже для версии [1.27.3 хардкод](https://docs.gitea.com/installation/install-with-docker/#configure-the-user-inside-gitea-using-environment-variables) 
по использованию пользователя с UID=1000 и GID=1000, чтобы преодолеть ошибку работы контейнера:
```bash
2026/09/16 21:41:51 modules/setting/setting.go:99:InitCfgProvider() 
[F] Unable to init config provider from "/data/gitea/conf/app.ini": 
unable to check if "/data/gitea/conf/app.ini" exists: stat /data/gitea/conf/app.ini: permission denied
```
Необходимо у директории для проекта gitea изменить владельца и группу:
```bash
chown -R 1000:1000 /Volume1/DockerAppData/gitea
```
Если запустить Gitea под пользовавтелем с правами root - получим ошибку:
```bash
2026/09/16 21:25:55 modules/setting/setting.go:196:mustNotRunAsRoot() [F] 
Gitea is not supposed to be run as root. If you need to use privileged TCP ports please instead use `setcap` 
and the `cap_net_bind_service` permission.
```
Для установки Gitea в TOS 7 необходимо создать пользователя без привилегий суперпользователя:
```bash
adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git
```

```bash
2026/09/16 21:41:51 modules/setting/setting.go:99:InitCfgProvider() 
[F] Unable to init config provider from "/data/gitea/conf/app.ini": 
unable to check if "/data/gitea/conf/app.ini" exists: stat /data/gitea/conf/app.ini: permission denied
```
```bash
chown -R git:git /Volume1/DockerAppData/gitea
```
Создать пользователя docker (нужен пользователь не в группе суперпользователя)
pwd Docker2026

добавляем uid и guid пользователя docker в yml:
cat /etc/passwd | grep docker

переходим на http://192.168.1.104:3003/ и проводим инсталляцию
в последнем разделе добавляем пользователя для работы с Gitea
vfsotnikov
Seva2005

на рабочем столе из контекстного меню выбираем "создать ярлык для веб-страницы"