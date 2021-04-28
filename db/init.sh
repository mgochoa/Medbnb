#!/bin/bash

docker build -t medbnb/mysql

docker run --name medbnb-mysql -p3306:3306 -d medbnb/mysql