-include env_make

CACHET_VER ?= 2.4.1
CACHET_MINOR_VER ?= $(shell echo "${CACHET_VER}" | grep -oE '^[0-9]+\.[0-9]+')

TAG ?= $(CACHET_MINOR_VER)

PHP_VER ?= 7.1
BASE_IMAGE_TAG = $(PHP_VER)

REPO = wodby/cachet
NAME = cachet-$(CACHET_MINOR_VER)

ifneq ($(STABILITY_TAG),)
    ifneq ($(TAG),latest)
        override TAG := $(TAG)-$(STABILITY_TAG)
    endif
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
		--build-arg CACHET_VER=$(CACHET_VER) \
	./

test:
	cd ./test && IMAGE=$(REPO):$(TAG) ./test.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
