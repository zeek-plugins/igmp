########## TYPES ##########

# IGMP message types
type IgmpMessageType: enum {
    MQ =   0x11,
    MRV1 = 0x12,
    MRV2 = 0x16,
    LG =   0x17,
    MRV3 = 0x22
};

# IGMP Version 3 Membership Report Group record types
type GroupType: enum {
    MODE_IS_INCLUDE =        1,
    MODE_IS_EXCLUDE =        2,
    CHANGE_TO_INCLUDE_MODE = 3,
    CHANGE_TO_EXCLUDE_MODE = 4,
    ALLOW_NEW_SOURCES =      5,
    BLOCK_OLD_SOURCES =      6
};

# IGMP Version 3 Membership Report Group record
type MulticastGroup: record {
    group_type: GroupType;
    aux_data_len: count;
    num_sources: count;
    multicast_addr: addr;
    sources: vector of addr;
    aux_data: string;
};


########## EVENTS ##########

##### START #####
event zeek_init()
    {
    if ( ! PacketAnalyzer::try_register_packet_analyzer_by_name("IP", 0x02, "IoT::IGMP") )
            Reporter::error("Failed to register IGMP Spicy analyzer.");
    print "IGMP analyzer registered.";
    }

# Triggered: IGMP Message (any type)
event igmp::message(pkt_hdr: raw_pkt_hdr)
    {
    ;
    }

# Triggered: IGMP Membership query
event igmp::membership_query(pkt_hdr: raw_pkt_hdr, group_addr: addr)
    {
    #print fmt("IGMP Membership Query for group %s", group_addr);
    }

# Triggered: IGMP Version 2 Membership Report 
event igmp::membership_report_v2(pkt_hdr: raw_pkt_hdr,
                                 group_addr: addr)
    {
    #print fmt("IGMP Version 2 Membership Report for group %s", group_addr);
    }

# Triggered: IGMP Leave Group message
event igmp::leave_group(pkt_hdr: raw_pkt_hdr,
                        group_addr: addr)
    {
    #print fmt("IGMP Version 2 Leave Group %s", group_addr);
    }

# Triggered: IGMP Version 3 Membership Report
event igmp::membership_report_v3(pkt_hdr: raw_pkt_hdr,
                                 num_groups: count,
                                 groups: vector of MulticastGroup)
    {
    #print "IGMP Version 3 Membership Report";
    #print fmt("    Number of groups: %d", num_groups);
    #print "    Groups", groups;
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
