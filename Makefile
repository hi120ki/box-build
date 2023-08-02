all: help

help: ## Print this help message
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build vagrant box
	bash build.sh &

setup: ## clone ansible project to ./provision
	cd ubuntu20 ; rm -rf provision ; git clone https://github.com/hi120ki/vm-setup.git provision
	cd ubuntu22 ; rm -rf provision ; git clone https://github.com/hi120ki/vm-setup.git provision
	cd kali ; rm -rf provision ; git clone https://github.com/hi120ki/kali-setup.git provision
