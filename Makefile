CURRENT_DIR = $(shell pwd)

default: help

help:
	@echo "\nDocker for Automation Project \n\n* type 'make run' for the first time *\n\
	\n1. 'make kv' to RUN kanvas automation testing \n2. 'make stop' to STOP the running engine \n3. 'make up' to RE-RUN the engine \n4. 'make prune' to DESTROY the engine"

build:
	docker image build -t alpinekanvasandro .

run: build
	docker-compose up -d

up:
	docker-compose up -d