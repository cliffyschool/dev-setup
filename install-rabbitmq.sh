#!/bin/sh
sudo echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc
sudo apt-get update
sudo apt-get install rabbitmq-server

