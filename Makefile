export PROJECT_NAME=churn-pred
export JUPYTER_CONTAINER_PORT=8888
export JUPYTER_HOST_PORT=9000
export IMAGE_NAME=$(PROJECT_NAME)-image
export CONTAINER_NAME=$(PROJECT_NAME)-cont
export DOCKERFILE=DockerFile
export DOCKER=docker
export PWD=`pwd`

build-docker: ## initialize docker image
	$(DOCKER) build -t $(IMAGE_NAME) -f $(DOCKERFILE) --build-arg UID=$(shell id -u) .

jupyter: ## start Jupyter Notebook server
	$(DOCKER) exec -u 0 -t $(CONTAINER_NAME) bash -c "jupyter lab --no-browser --ip=0.0.0.0 --port=${JUPYTER_CONTAINER_PORT} --allow-root"

run-cont: ## create docker container
	$(DOCKER) run -it -d -v $(PWD):/opt/ml/ -p $(JUPYTER_HOST_PORT):$(JUPYTER_CONTAINER_PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)
	$(DOCKER) exec -u 0 -t $(CONTAINER_NAME) bash -c "pip install -e /opt/ml/"

rm-img:
	-$(DOCKER) image rm $(IMAGE_NAME)

stop-cont:
	-$(DOCKER) stop $(CONTAINER_NAME)

rm-cont:
	-$(DOCKER) rm $(CONTAINER_NAME)

start-cont:
	-$(DOCKER) start $(CONTAINER_NAME)