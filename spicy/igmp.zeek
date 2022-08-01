event zeek_init()
    {
    if ( ! PacketAnalyzer::try_register_packet_analyzer_by_name("IP", 0x02, "IoT::IGMP") )
            Reporter::error("Failed to register IGMP Spicy analyzer.");
    print "IGMP analyzer registered.";
    }

event igmp::message(pkt_hdr: raw_pkt_hdr)
    {
    ;
    }

event igmp::membership_query(pkt_hdr: raw_pkt_hdr, group_addr: addr)
    {
    print fmt("IGMP Membership Query for group %s", group_addr);
    }

event igmp::membership_report_v2(pkt_hdr: raw_pkt_hdr,
                                 group_addr: addr)
    {
    print fmt("IGMP Version 2 Membership Report for group %s", group_addr);
    }

event igmp::leave_group(pkt_hdr: raw_pkt_hdr,
                        group_addr: addr)
    {
    print fmt("IGMP Version 2 Leave Group %s", group_addr);
    }

event igmp::membership_report_v3(pkt_hdr: raw_pkt_hdr,
                                 num_groups: count)
    {
    print "IGMP Version 3 Membership Report";
    print fmt("    Number of groups: %d", num_groups);
    }

event zeek_done()
    {
    print "STOP";
    }