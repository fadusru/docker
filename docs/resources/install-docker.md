# Установка Docker в Debian

Для установки официальной версии Docker на Debian необходимо удалить старые пакеты, добавить официальный 
репозиторий Docker через apt, импортировать GPG-ключ и установить пакеты docker-ce, docker-ce-cli, containerd.io 
и плагины [Install Docker Engine on Debian | Docker Docs](https://docs.docker.com/engine/install/debian/).

## Пошаговая установка

1. Удалите старые версии (если они были установлены):
```bash
sudo apt-get remove docker.io docker-doc docker-compose podman-docker containerd runc
```
2. Обновите индекс пакетов и установите зависимости:
```bash
sudo apt-get update
```
```bash
sudo apt-get install ca-certificates curl gnupg
```
3. Добавьте официальный GPG-ключ Docker:
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
4. Добавьте репозиторий в источники APT:
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
5. Установите Docker Engine и плагины:
```bash
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Проверка работы

1. Проверьте статус службы:
```bash
sudo systemctl status docker
```
2. Запустите тестовый контейнер:
```bash
sudo docker run hello-world
```