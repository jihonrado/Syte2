REPO=eu.gcr.io/jihonrado-main/jihonrado-web
VERSION=0.1.3

.PHONY: image
image:
	docker build . -t $(REPO):$(VERSION) -t $(REPO):latest

.PHONY: push
push: image
	docker push $(REPO):$(VERSION)
	docker push $(REPO):latest
