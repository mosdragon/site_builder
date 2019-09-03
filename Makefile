
all: serve

submodule:
	@git submodule update --init --recursive

serve: submodule
	@hugo serve -D -p 8080 --disableFastRender

build: submodule
	@hugo

deploy: build
	@scripts/deploy.sh
