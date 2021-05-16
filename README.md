# Статический сайт в Docker контейнере

Репозиторий содержит исходный код, на основе которого с помощью генератора статических сайтов [Hugo](https://gohugo.io/) выполняется его сборка и запуск.
Сборка проиходит в промежуточном образе и не требует установки [Hugo](https://gohugo.io/) на хосте.
Собранный сайт копируется в образ с веб-сервером.

## Использование
Для работы [Hugo](https://gohugo.io/) необходима тема, которая находится в директории [themes/m10c](./themes/m10c) и представлена в проекте как git подмодуль.
Необходимо склонировать репозиторий вместе с подмодулями
```
git clone --recurse-submodules https://github.com/ShumilinPavel/nx_bootcamp_webapp
```
Собрать Docker образ
```
./scripts/build.sh
```
Запустить контейнер с сайтом, который будет доступен на `localhost:80`
```
./scripts/run.sh
```
