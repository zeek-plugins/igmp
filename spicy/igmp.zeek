event zeek_init()
    {
    if ( ! PacketAnalyzer::try_register_packet_analyzer_by_name("IP", 0x02, "IoT::IGMP") )
            Reporter::error("Failed to register IGMP Spicy analyzer.");
    }

event zeek_done()
    {
    print "STOP";
    }