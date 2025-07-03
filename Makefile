# Makefile for images and container setup

.PHONY: help setup build build-no-cache up up-verbose down restart logs clean

help:
	@echo "Common commands:"
	@echo "  make setup     Run npm install inside frontend container"
	@echo "  make build     Build Docker images"
	@echo "  make up        Start containers (frontend + others)"
	@echo "  make down      Stop containers"
	@echo "  make logs      Tail logs"
	@echo "  make clean     Remove containers, volumes, node_modules"

setup:
	docker-compose run --rm frontend npm install

build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

up: down build-no-cache setup # depending on down before up is basically restart
	docker-compose up -d

up-verbose:
	docker-compose up

down:
	docker-compose down --volumes --remove-orphans 

# restart:
# 	docker-compose down && docker-compose up

logs:
	docker-compose logs -f --tail=50

clean: down
	rm -rf frontend/node_modules frontend/package-lock.json
