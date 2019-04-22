.PHONY: build run
REGISTRY ?= szc10
REPO  ?= apache-php
TAG   ?= latest
build:
	docker build -t $(REGISTRY)/$(REPO):$(TAG) .
	
push: 
	docker push $(REGISTRY)/$(REPO):$(TAG)

show:
	echo $(REGISTRY)/$(REPO):$(TAG)