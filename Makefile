
all: serve

submodule:
	@git submodule update --init --recursive

serve: submodule
	@hugo serve -D -p 8080

build: submodule
	@hugo

deploy: build
	@scripts/deploy.sh
