APP_NAME=qwen2-service

image:
	docker build -t $(APP_NAME) -f docker/Dockerfile .

base-image:
	docker build -t $(APP_NAME)-base -f docker/Dockerfile.base .

.PHONY: dev-env
dev-env:
	docker run -d \
		--gpus all \
		-p 8000:8000 \
		-v ${PWD}:/root/$(APP_NAME) \
		-v ${HOME}/.cache/huggingface:/root/.cache/huggingface \
		--rm --name $(APP_NAME)-dev \
		docker.io/library/$(APP_NAME)-base tail -f /dev/null

.PHONY: run
run:
	docker run --rm --name $(APP_NAME)-dev -p 8000:8000 docker.io/library/$(APP_NAME)
