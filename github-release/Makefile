SHELL := /bin/bash
VERBOSE ?= 0
TAP ?= p
APP_ROOT ?= $(shell pwd)
VERSION ?= $(shell cat "$(APP_ROOT)/VERSION")
TRAVIS_JOB_NUMBER ?= 0-dev
TAG ?= $(VERSION).$(TRAVIS_JOB_NUMBER)
DOCKER_USERNAME ?= $(shell git config --get user.email | sed 's/\(.*\)@\(.*\)/\1/')
DOCKER_IMAGE ?= github-release

.PHONY: build test
default: build test

build:
	docker build --target build -t $(DOCKER_IMAGE):$(TAG) .
	docker build --target test -t $(DOCKER_IMAGE):$(TAG)-test .

test:
	docker run -e TAP -e VERBOSE --rm $(DOCKER_IMAGE):$(TAG)-test ./run-bats.sh .
