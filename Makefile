.PHONY: build run help

default: help

help:
	@echo "Available targets:"
	@echo
	@echo "  build - Build the Docker image ghanique/neo4j-bloom"
	@echo "  run   - Run the neo4j-bloom container"

build:
	docker build -t ghanique/neo4j-bloom .

run:
	docker run -d -p 8080:80 --name neo4j-bloom ghanique/neo4j-bloom
