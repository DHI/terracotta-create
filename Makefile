IMAGE_NAME = ""
VERSION = "v0.8.3"

all: build push

build:
	docker build \
		-f Dockerfile \
		-t ${IMAGE_NAME}:${VERSION} .

push:
	docker push ${IMAGE_NAME}:${VERSION}

.PHONY: build push