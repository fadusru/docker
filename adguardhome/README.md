# AdGuard Home

## Образ и настройка
[Официальный образ adguard/adguardhome на Docker Hub](https://hub.docker.com/r/adguard/adguardhome)

Для настройки конфигурации AdGuardHome открываем http://ip-nas:3000. 
Рекомендую нажимать "Далее" и ничего не менять в интерфейсе.
После настройки конфигурации можно открывать "Основной" интерфейс http://ip-nas:порт-который-вы-поставили

## Краткая инструкция по переопределению DNS записей на своем AdGuard Home
На странице [Простая установка и настройка AdGuard Home](https://losst.pro/ustanovka-i-nastrojka-adguard-home) 
раздел "Переопределение DNS записей":
Для этого откройте Filters -> DNS Rewrites и нажмите Add DNS Rewrite. 
Далее заполните домен: adguard.home.arpa и IP адрес своего устройства

## Что еще почитать?
[Рекомендации по настройке AdGuard Home](https://fadus.ru/recommendations-for-configuring-adguard-home/)

[AdguardHome и Synology NAS блокируем рекламу во всем доме](https://bafista.ru/adguardhome-i-synology-nas-blokiruem-reklamu-vo-vsem-dome/)

[Установка Adguard Home и разблокировка Docker Hub, ClamAV и TMDB](https://bafista.ru/ustanovka-adguard-home-i-razblokirovka-docker-hub-clamav-i-tmdb/)
