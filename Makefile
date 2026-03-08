PREFIX ?= /usr/local

install:
	install -d $(PREFIX)/bin
	install -m 755 aws-config-gen $(PREFIX)/bin/aws-config-gen

uninstall:
	rm -f $(PREFIX)/bin/aws-config-gen

.PHONY: install uninstall
