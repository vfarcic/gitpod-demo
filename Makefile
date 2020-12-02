SHELL := /bin/bash

init:
	git submodule init
	git submodule update
	cp content/img/banner.jpg themes/forty/static/img/.
        codefresh auth create-context devops-catalog --api-key $CF_TOKEN
        codefresh create pipeline -f codefresh-master.yml

build:
	hugo

dev:
	hugo server

