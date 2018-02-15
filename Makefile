ARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

#############################
# ENVIRONMENT
#############################

export PROJECT_NAME=project
export COMPOSE_PROJECT_NAME=${PROJECT_NAME}


#############################
# CONTAINER ACCESS
#############################

up:
	docker-compose up -d

stop:
	docker-compose stop

destroy: stop
	docker-compose down --rmi all --remove-orphans

restart: stop up


#############################
# CONTAINER ACCESS
#############################

ssh:
	docker exec -it $$(docker-compose ps -q $(ARGS)) sh


#############################
# TESTING
#############################

validator:
	docker exec -it $$(docker-compose ps -q validator) java -jar /vnu.jar http://web/


#############################
# Argument fix workaround
#############################
%:
	@: