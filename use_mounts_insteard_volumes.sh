#!/bin/bash

# 1. Остановить сервисы для обеспечения согласованности данных
docker compose stop

# 2. Создать целевые каталоги
mkdir -p ./volumes/{netbird_data,netbird_proxy_certs,netbird_traefik_letsencrypt,crowdsec_db}

# 3. Скопировать данные из контейнеров (-a сохраняет права доступа)
docker compose cp -a netbird-server:/var/lib/netbird/. ./volumes/netbird_data
docker compose cp -a proxy:/certs/. ./volumes/netbird_proxy_certs
docker compose cp -a traefik:/letsencrypt/. ./volumes/netbird_traefik_letsencrypt
docker compose cp -a crowdsec:/var/lib/crowdsec/data/. ./volumes/crowdsec_db

# 4. Restart
docker compose down
docker compose up -d
