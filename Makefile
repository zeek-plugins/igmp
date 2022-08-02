.PHONY: install remove test

install:
	zkg --user install .

remove:
	zkg --user remove .

test:
	make -C testing
