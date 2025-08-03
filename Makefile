IMAGES_DIR := images
IMAGE_DIRS := $(wildcard $(IMAGES_DIR)/*)
IMAGE_NAMES := $(notdir $(IMAGE_DIRS))
TAG ?= latest

.PHONY: all build-images up $(IMAGE_NAMES)

all: build-images up

build-images: $(IMAGE_NAMES)

$(IMAGE_NAMES):
	docker build -t $@:$(TAG) $(IMAGES_DIR)/$@

up:
	docker compose up -d

down:
	docker compose down

# Usage:
# make TAG=yourtag