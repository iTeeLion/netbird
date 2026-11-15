#!/bin/bash

#docker compose pull netbird-server dashboard
#docker compose up -d --force-recreate netbird-server dashboard

docker compose pull traefik dashboard netbird-server proxy crowdsec
docker compose up -d --force-recreate traefik dashboard netbird-server proxy crowdsec
