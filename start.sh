#!/bin/bash

redis-server redis1.conf & 
redis-server redis2.conf & 
redis-server redis3.conf &

sleep 3

redis-cli --cluster create 127.0.0.1:6379 127.0.0.1:6380 127.0.0.1:6381 --cluster-replicas 0
redis-cli cluster info | grep state
