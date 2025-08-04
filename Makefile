IMAGES_DIR := images
IMAGE_DIRS := $(wildcard $(IMAGES_DIR)/*)
IMAGE_NAMES := $(notdir $(IMAGE_DIRS))
TAG ?= latest

.PHONY: all build-images up virtualenv activate $(IMAGE_NAMES)

all: build-images up

# Usage:
# make TAG=yourtag, defaults to 'latest'
build-images: $(IMAGE_NAMES)

$(IMAGE_NAMES):
	cd $(IMAGES_DIR)/$@ && docker build -t $@:$(TAG) . && cd -

up:
	docker compose up -d

down:
	docker compose down

# venv can be activated with:
# source .venv/bin/activate
virtualenv:
	python3 -m venv .venv
	.venv/bin/pip install -r requirements.txt

	
