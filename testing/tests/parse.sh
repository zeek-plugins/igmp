# @TEST-DOC: Verify parsing of IGMP messages
# @TEST-EXEC: bash %INPUT


##### VARIABLES #####

# IGMP test messages
MEMBERSHIP_REPORT_V2='\x16\x00\x09\x04\xe0\x00\x00\xfb'
LEAVE_GROUP='\x17\x00\x08\x04\xe0\x00\x00\xfb'
MEMBERSHIP_REPORT_V3='\x22\x00\xea\x03\x00\x00\x00\x01\x04\x00\x00\x00\xef\xff\xff\xfa'
BAD_CHECKSUM='\x16\x00\x09\x05\xe0\x00\x00\xfb'
# Files
COMPILED_FILE="igmp.hlto"
MRV2_OUTPUT="mrv2_output.txt"
LEAVE_OUTPUT="leave_output.txt"
MRV3_OUTPUT="mrv3_output.txt"
CHECKSUM_OUTPUT="checksum_output.txt"


##### COMMANDS #####

# Compilation
spicyc ${DIST}/analyzer/igmp.spicy -j -d -o $COMPILED_FILE
# Membership Report Version 2
printf $MEMBERSHIP_REPORT_V2 | spicy-dump $COMPILED_FILE 2>&1 >> $MRV2_OUTPUT
btest-diff $MRV2_OUTPUT
# Leave Group
printf $LEAVE_GROUP | spicy-dump $COMPILED_FILE 2>&1 >> $LEAVE_OUTPUT
btest-diff $LEAVE_OUTPUT
# Membership Report Version 3
printf $MEMBERSHIP_REPORT_V3 | spicy-dump $COMPILED_FILE 2>&1 >> $MRV3_OUTPUT
btest-diff $MRV3_OUTPUT
# Membership Report Version 2 with bad checksum
printf $BAD_CHECKSUM | spicy-dump $COMPILED_FILE 2>&1 >> $CHECKSUM_OUTPUT
btest-diff $CHECKSUM_OUTPUT
