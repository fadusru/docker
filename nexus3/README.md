# Установка и настройка Nexus CE

## Дистрибутив
[Dockerfile](https://github.com/sonatype/docker-nexus3/blob/main/Dockerfile.alpine.java21) \
[image: sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/)

## Ошибки и рекомендации по их преодолению

### Ошибка "can't create directory ...: Permission denied"

В [Dockerfile](https://github.com/sonatype/docker-nexus3/blob/main/Dockerfile.alpine.java21) хардкод с созданием группы и пользователя:

`&& groupadd --gid 200 -r nexus \`
`&& useradd --uid 200 -r nexus -g nexus -s /bin/false -d /opt/sonatype/nexus -c 'Nexus Repository Manager user'`

На ряде ОС возникает ошибка: 
`mkdir: can't create directory '/opt/sonatype/nexus/../sonatype-work/nexus3/log': Permission denied`
она описана на https://stackoverflow.com/questions/48513734/error-while-mounting-host-directory-in-nexus-docker

Чтобы исправить ошибку необходимо сменить владельца директории с данными Nexus на такого же как в контейнере: 
`chown -R 200:200 /Volume1/DockerAppData/nexus3`

### Ошибка "server gave HTTP response to HTTPS client"
При подключении к Nexus по протоколу http может возникнуть ошибка: 
`Error response from daemon: failed to resolve reference "127.0.0.1:8082/nginx:latest": 
failed to do request: Head "https://127.0.0.1:8082/v2/nginx/manifests/latest": 
http: server gave HTTP response to HTTPS client`

Утилита docker ожидает, что registry работает по защищенному соединению HTTPS. 
Можно разрешить подключение по незащищенному протоколу.

#### Рекомендация для Docker Desktop

Для ее преодоления на стороне клиента, в Docker Desktop добавляем исключение: \
В Settings -> Docker Engine добавляем наш Nexus (чтобы увидеть текст с разметкой - перейдите в режим RAW):
`  "insecure-registries": [
    "127.0.0.1:8082"
  ]`

Итоговый файл `daemon.json` у меня выглядит так (чтобы увидеть текст с разметкой - перейдите в режим RAW): \
`{
  "builder": {
    "gc": {
    "defaultKeepStorage": "20GB",
    "enabled": true
    }
  },
  "experimental": false,
  "insecure-registries": [
    "127.0.0.1:8082"
  ],
  "registry-mirrors": [
    "https://mirror.yandex.ru",
    "https://dockerhub.timeweb.cloud",
    "https://mirror.gcr.io"
  ]
}`
Инструкция https://docs.docker.com/reference/cli/dockerd

#### Рекомендация для Docker CLI (Linux based)

Необходимо репозиторий добавить в белый список.

На хосте, где работает docker, отредактировать или создай файл “daemon.json” (возможно, сначала нужно установить nano): \
`nano /etc/docker/daemon.json`

В файле обнови или добавь следующий раздел:
`{
"insecure-registries":["host:port"]
}` \
где “host:port” — это IP-адрес или доменное имя твоего сервера репозитория и его порт 

Пример:

`{
"insecure-registries":[
"registry1:80",
"registry2:458"
]
}`

Перезапусти службу docker

Alpine \
`service docker restart`

Ubuntu \
`systemctl restart docker`

## Инструкции по установке, настройке и использованию
[Установка и использование Nexus Repository для хранения артефактов](https://reg.cloud/blog/ustanovka-i-ispolzovanie-nexus-repository/) \
[Установка приватного Docker репозитория](https://k2.cloud/news/about-technologies/ustanovka-docker-repozitoriya/) \
[Как я могу заставить docker использовать http, а не https?](https://www.reddit.com/r/docker/comments/1d2utpn/how_can_i_make_docker_use_http_and_not_https/?tl=ru) \
[Настройка SSL-соединения на прокси сервере nginx](https://stackoverflow.com/questions/39148462/docker-login-not-working-with-nexus-3-private-registry)
