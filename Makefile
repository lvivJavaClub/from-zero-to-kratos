COMPOSE_FILE := docker-compose.yml

build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans

logs:
	docker-compose -f $(COMPOSE_FILE) logs -f --tail=100

restart: down up

clean: down
	docker volume rm kratos_postgres_data || true
	docker volume rm javaclub_demo_postgres_data || true
	docker network prune -f

clean-all: clean
	docker system prune -af

ps:
	@docker ps --format "{{.Names}}|{{.Image}}|{{.Ports}}" | while IFS="|" read -r name image ports; do \
		printf "\n📦  \033[1m%s\033[0m\n" "$$name"; \
		printf "    🖼️  Image: %s\n" "$$image"; \
		echo "$$ports" | tr ',' '\n' | sed 's/^/    🔌 Port: /'; \
	done

.PHONY: build up down logs restart clean clean-all ps-pretty
