# За базовый образ возьмем openjdk:17-ea-slim. В качестве альтернативы можно взять openjdk:17-ea-alpine
FROM openjdk:17-ea-slim
# Больше как информация ссылка на автора dockerfile
LABEL authors="fadus.ru"
# Установим рабочей директорией /app
WORKDIR /app
# Скопируем из каталога содержащий dockerfile файл gitbucket.war в рабочую директорию (в нашем случае /app)
COPY gitbucket.war .
# Декларируем для дальнейшего использования порт 8080. В коде GitBucket все настроено для работы с портом 8080
EXPOSE 8080
# При запуске контейнера будет запущено java -jar gitbucket.war
ENTRYPOINT ["java", "-jar", "gitbucket.war"]