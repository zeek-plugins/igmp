########## IMPORTS ##########
@load igmp

########## EVENTS ##########

##### START #####
event zeek_init()
    {
    ;
    }

# Triggered: IGMP Message (any type)
event igmp::message(pkt_hdr: raw_pkt_hdr, msg_type: IGMP::IgmpMessageType)
    {
    #print fmt("IGMP Message of type %s", msg_type);
    }

# Triggered: IGMP Membership query
event igmp::membership_query(pkt_hdr: raw_pkt_hdr, group_addr: addr)
    {
    print fmt("IGMP Membership Query for group %s", group_addr);
    }

# Triggered: IGMP Version 2 Membership Report 
event igmp::membership_report_v2(pkt_hdr: raw_pkt_hdr,
                                 group_addr: addr)
    {
    print fmt("IGMP Version 2 Membership Report for group %s", group_addr);
    }

# Triggered: IGMP Leave Group message
event igmp::leave_group(pkt_hdr: raw_pkt_hdr,
                        group_addr: addr)
    {
    print fmt("IGMP Version 2 Leave Group %s", group_addr);
    }

# Triggered: IGMP Version 3 Membership Report
event igmp::membership_report_v3(pkt_hdr: raw_pkt_hdr,
                                 num_groups: count,
                                 groups: vector of IGMP::MulticastGroup)
    {
    print "IGMP Version 3 Membership Report";
    print fmt("    Number of groups: %d", num_groups);
    print "    Groups", groups;
    }

# Triggered: IGMP Message with bad checksum
event igmp::bad_checksum(pkt_hdr: raw_pkt_hdr,
                         transmitted_checksum: count,
                         computed_checksum: count)
    {
    print fmt("Bad checksum ! Transmitted: 0x%x, Computed: 0x%x", transmitted_checksum, computed_checksum);
    }

##### STOP #####
event zeek_done()
    {
    print "STOP";
    }
