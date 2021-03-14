#!/bin/bash
docker build /home/task3/client/ -t client
if [ "$(docker ps -a | grep client)" ]; then
  docker stop $(docker ps -a | grep client |awk '{print  $1}')
  docker rm $(docker ps -a | grep client |awk '{print  $1}')
fi
docker run -dit --name client -p 80:80  -t client

