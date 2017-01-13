IMAGE = $(REGISTRY)/$(PROJECT):$(TAG)

REGISTRY = 685025444706.dkr.ecr.us-east-1.amazonaws.com
PROJECT	= go-docker
TAG ?= latest

.PHONY: build
build: Dockerfile
	docker build --rm -t $(IMAGE) .

.PHONY: run
run:
	docker run --rm -it \
	  -p 8080:8080 \
	  -v $(PWD)/app/MathApp:/go/src/MathApp \
	  -w /go/src/MathApp $(IMAGE)
