main: clean compile run

.PHONY: clean compile run

clean:
	rm -f *.hlto

compile:
	spicyz -o igmp.hlto igmp.spicy igmp.evt

run:
	zeek -r igmp.pcap -b igmp.zeek igmp.hlto
