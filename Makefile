SHELL:=/bin/bash

### TASKS ###
## Sbt tasks ##
sbt-shell:
	sbt -Dsbt.repository.config=./repositories -Dsbt.override.build.repos=true

## Docker tasks ##
dock-build:
	DOCKER_BUILDKIT=1 docker build --compress --target deploy -t xtd/xsl-tester .
dock-rmi:
	docker rmi xtd/xsl-tester

## Docker-Compose tasks ##
compose-up:
	docker-compose up -d
compose-down:
	docker-compose down
compose-start:
	docker-compose start
compose-stop:
	docker-compose stop
