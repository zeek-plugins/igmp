.PHONY: install remove test clean

install:
	zkg --user install .

remove:
	zkg --user remove .

test:
	make -C testing

clean:
	rm -rf testing/.tmp
	rm -f testing/.btest.failed.dat
