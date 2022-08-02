##! This is loaded automatically at Zeek startup once the plugin gets activated
##! and its BiF elements have become available.
#
##! File load order, always happens
##!   1. Zeek startup
##!   2. Plugin activation
##!   3. __preload__.zeek always gets loaded
##!   4. __load__.zeek always gets loaded <-- YOU ARE HERE
##!
##! ONLY IF the plugin gets loaded via `@load IoT/mdns`, this continues:
##!   5. @load IoT/mdns/__load__.zeek
##!
# Include code here that should always execute unconditionally when your plugin gets activated.
#
# Note that often you may want your plugin's accompanying scripts not here, but
# in scripts/IoT/mdns/__load__.zeek.
# That's processed only on explicit `@load IoT/mdns`.

@load ./main
#@load-sigs ./dpd.sig
