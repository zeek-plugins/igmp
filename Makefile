all: remove install

.PHONY: install remove test clean

install:
	zkg --user -vvv install .

remove:
	zkg --user -vvv remove .

test:
	make -C testing

clean:
	rm -rf testing/.tmp
	rm -f testing/.btest.failed.dat
