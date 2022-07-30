main: compile run

compile:
	spicyz -o igmp.hlto igmp.spicy igmp.evt

run:
	zeek -r igmp.pcap -b igmp.zeek igmp.hlto
