-include /usr/local/bin/php.mk

.PHONY: init

default: init

init:
	sudo -E init
