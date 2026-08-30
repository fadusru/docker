# Запустим скрипт в консоли для вывода пароля пользователя admin
docker exec -it nexus cat /nexus-data/admin.password

# Пример вывода в Терминал у меня. Заменил информацию о моем локальном пользователе на NAS
# user@f6:/# docker exec -it nexus cat /nexus-data/admin.password
# b3fec9d6-2afd-4914-9068-20cc5eb13550