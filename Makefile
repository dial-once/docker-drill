NAMESPACE = dialonce
IMAGE = drill
VERSION ?= latest

build:
	docker build -t $(NAMESPACE)/$(IMAGE) .

run:
	docker run -it $(NAMESPACE)/$(IMAGE)

push:
	docker login -e $(DOCKER_EMAIL) -u $(DOCKER_USER) -p $(DOCKER_PASS)
	docker push $(NAMESPACE)/$(IMAGE):$(VERSION)

.PHONY: build
