#!/bin/bash
docker-machine create -d xhyve --virtualbox-hostonly-cidr "192.168.64.5/24" --virtualbox-ui-type "headless" registry 
docker-machine ssh registry "mkdir ~/data"
eval $(docker-machine env registry)
docker run -d -p 80:5000 --restart=always --name registry   -v /home/docker/data:/srv/registry registry:2
REG_IP=`docker-machine ip registry`
export REG_IP

