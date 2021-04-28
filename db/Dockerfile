FROM mysql:latest

LABEL maintainer="mochoa1127@gmail.com"

ENV MYSQL_ROOT_PASSWORD backend
ENV MYSQL_DATABASE medbnb
ENV MYSQL_USER backend
ENV MYSQL_PASSWORD backend

WORKDIR /mysql_scripts
ADD *.sql /docker-entrypoint-initdb.d

EXPOSE 3306

