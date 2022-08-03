# @TEST-DOC: Runs the IGMP analyzer on a pcap file.
# @TEST-EXEC: bash %INPUT


##### VARIABLES #####

ANALYZER_DIR="${DIST}/analyzer"
PCAP="${TRACES}/igmp.pcap"
PCAP_BAD_CHECKSUM="${TRACES}/igmp-bad-checksum.pcap"
OUTPUT="zeek-output.txt"
OUTPUT_BAD_CHECKSUM="zeek-output-bad-checksum.txt"


##### COMMANDS #####

# Compilation
#spicyz $ANALYZER_DIR/igmp.spicy $ANALYZER_DIR/igmp.evt -o igmp.hlto
# Pcap with good checksum analysis
zeek -b -r $PCAP ${PACKAGE} ${SCRIPTS}/igmp.zeek > $OUTPUT
btest-diff $OUTPUT
# Pcap with bad checksum analysis
zeek -b -r $PCAP_BAD_CHECKSUM ${PACKAGE} ${SCRIPTS}/igmp.zeek > $OUTPUT_BAD_CHECKSUM
btest-diff $OUTPUT_BAD_CHECKSUM
