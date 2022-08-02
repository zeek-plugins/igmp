# Script directory
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(realpath "${SCRIPT_DIR}")"

# IGMP messages
MEMBERSHIP_REPORT_V3='\x22\x00\xea\x03\x00\x00\x00\x01\x04\x00\x00\x00\xef\xff\xff\xfa'
MEMBERSHIP_REPORT_V2='\x16\x00\x09\x04\xe0\x00\x00\xfb'
LEAVE_GROUP='\x17\x00\x08\x04\xe0\x00\x00\xfb'
BAD_CHECKSUM='\x16\x00\x09\x05\xe0\x00\x00\xfb'

printf $BAD_CHECKSUM | spicy-driver "$SCRIPT_DIR/../../analyzer/igmp.spicy"
