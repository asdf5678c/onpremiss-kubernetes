#!/bin/sh
docker-compose up -d --build
docker cp ops:/root/.ssh/id_rsa_ops.pub id_rsa_ops.pub
docker cp id_rsa_ops.pub master01:/root/.ssh/Authorized_keys 
docker cp id_rsa_ops.pub master02:/root/.ssh/Authorized_keys 
docker cp id_rsa_ops.pub master03:/root/.ssh/Authorized_keys 
docker cp id_rsa_ops.pub node01:/root/.ssh/Authorized_keys 

