
.PHONY: all
all: serve

.PHONY: submodule
submodule:
	@git submodule update --init --recursive

.PHONY: serve
serve: 
	@hugo serve -D -p 8080 --disableFastRender

.PHONY: build
build:
	@hugo

.PHONY: publish
publish: build
	@scripts/publish.sh
