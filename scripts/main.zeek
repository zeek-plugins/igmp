module IGMP;

event zeek_init()
	{
	if ( PacketAnalyzer::try_register_packet_analyzer_by_name("IP", 0x02, "IoT::IGMP") ) {
		print "IGMP Spicy analyzer registered.";
	} else {
        Reporter::error("Failed to register IGMP Spicy analyzer.");
	}
	}
