DAY=0
include .env

prepare: ## Prepare everything for a given day
	mkdir -p day${DAY}
	curl --header "Cookie: session=${COOKIE_SESSION}" https://adventofcode.com/2023/day/${DAY}/input > day${DAY}/input.txt
	cp main.py.template > day${DAY}/main.py

run: ## Run main script for a given day
	python day${DAY}/main.py

.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
