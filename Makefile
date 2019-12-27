
all: serve

submodule:
	@git submodule update --init --recursive

serve: 
	@hugo serve -D -p 8080 --disableFastRender

build:
	@hugo

publish: build
	@scripts/publish.sh
