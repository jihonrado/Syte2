IMAGE_NAME=jihonrado/jihonrado.com
VERSION=0.1.9

.PHONY: build
build:
	docker build . -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest

.PHONY: push
push: build
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest
