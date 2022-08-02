# Script directory
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(realpath "${SCRIPT_DIR}")"
SRC_DIR="$SCRIPT_DIR/../../analyzer"

# Commands
spicyz -o "$SRC_DIR/igmp.hlto" "$SRC_DIR/igmp.spicy" "$SRC_DIR/igmp.evt"
zeek -b -r "$SCRIPT_DIR/../Traces/igmp-bad-checksum.pcap" "$SCRIPT_DIR/../tests/igmp.zeek" "$SRC_DIR/igmp.hlto"
