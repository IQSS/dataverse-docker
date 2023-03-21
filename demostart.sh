#!/bin/bash
docker network create traefik
cp .env_sample .env
docker-compose up -d
