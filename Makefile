
all: serve

submodule:
	@git submodule update --init --recursive

serve: 
	@hugo serve -D -p 8080 --disableFastRender

build:
	@hugo

deploy: build
	@scripts/deploy.sh
