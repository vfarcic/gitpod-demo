SHELL := /bin/bash

init:
	git submodule init
	git submodule update
	cp content/img/banner.jpg themes/forty/static/img/.
        -codefresh auth create-context devops-catalog --api-key $CF_TOKEN
        -codefresh create context git github devops-catalog --access-token $GH_TOKEN
        export GH_REPO=$(git config --get remote.origin.url | sed -e "s@https://github.com/@@g" | sed -e "s@\.git@@g")
        cat codefresh/codefresh-master.yml | sed -e "s@CHANGE_ME_REPO@$GH_REPO@g" | tee codefresh-master.yml
	-codefresh create pipeline -f codefresh-master.yml

build:
	hugo

dev:
	hugo server

