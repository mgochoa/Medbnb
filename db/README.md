Docker development database
---

Dockerfile image uses mysql:latest


To build run: 

`docker build -t medbnb/mysql .`

To initialize a new image for dev environment:

`docker run --name medbnb-mysql -p3306:3306 -d medbnb/mysql`


If you are in linux just run  `./init.sh`