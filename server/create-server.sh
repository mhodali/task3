#!/bin/bash
docker build /home/task3/server/ -t server
if [ "$(docker ps -a | grep server)" ]; then
  docker stop $(docker ps -a | grep server |awk '{print  $1}')
  docker rm $(docker ps -a | grep server |awk '{print  $1}')
fi
docker run -dit -p 8899:8899 -t server
