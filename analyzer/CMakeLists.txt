spicy_add_analyzer(
    NAME Message
    PACKAGE_NAME Message
    SOURCES igmp.spicy igmp.evt
    SCRIPTS __load__.zeek main.zeek dpd.sig)
