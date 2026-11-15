#!/bin/bash

docker compose pull traefik dashboard netbird-server proxy crowdsec
docker compose up -d --force-recreate traefik dashboard netbird-server proxy crowdsec

# docker image prune -f
