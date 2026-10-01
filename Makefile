build:
	docker compose up --build -d

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

php:
	docker compose exec php sh

# We enter into the Node container interactive with the following command
# because we use NodeJS only for frontend development and because of that the
# Node service runs on build only to build frontend stuff and exits immediately!
# Because it exits immediately we no longer can use `docker compose exec node`
# therefore we use the following command to start a temporary container. The
# `--rm` flag in this command deletes the container right after it exists.
# Bottom line: A temporary container is created which is deleted upon exit!
node:
	docker compose run --rm node sh

init:
	@git pull
	@git submodule update --init
	@make build

cleanup:
	@make down
	@rm -rf app
