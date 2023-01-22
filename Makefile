

.PHONY:	setup ls up down logs db-sh mw-sh

# ----------------------------------------------------------------------------

setup:
	-mkdir db images
	-docker network create mw-net
	-cp env.tamplate .env

ls:
	-docker ps
	-docker network ls
	-docker volume ls

config:
	docker compose config

# ----------------------------------------------------------------------------

up:
	docker compose up -d
	docker ps

down:
	docker compose down
	docker ps

# ----------------------------------------------------------------------------

logs:
	docker logs mw-mediawiki

db-sh:
	docker exec -it mw-mariadb bash

mw-sh:
	docker exec -it mw-mediawiki bash


