# Запустим скрипт в консоли для вывода пароля пользователя admin
docker exec -it nexus-3-96-1 cat /nexus-data/admin.password && echo

# Пример вывода в Терминал у меня.
# user@f8:/# docker exec -it nexus cat /nexus-data/admin.password && echo
# b3fec9d6-2afd-4914-9068-20cc5eb13550