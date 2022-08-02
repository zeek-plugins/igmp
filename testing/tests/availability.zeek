@TEST-DOC: Check that the IGMP packet analyzer is available.
@TEST-EXEC: zeek -NN | grep -qi IGMP
