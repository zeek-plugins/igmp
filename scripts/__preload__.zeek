##! This is loaded automatically at Zeek startup once the plugin gets activated,
##! but before any of the BiFs that the plugin defines become available.
##!
##! File load order, always happens
##!   1. Zeek startup
##!   2. Plugin activation
##!   3. __preload__.zeek always gets loaded <-- YOU ARE HERE
##!   4. __load__.zeek always gets loaded
##!
##! ONLY IF the plugin gets loaded via `@load IoT/mdns`, this continues:
##!   5. @load IoT/mdns/__load__.zeek
##!
##! This is primarily for defining types that BiFs already depend on.  If you
##! need to do any other unconditional initialization, that should go into
##! __load__.zeek instead.

@load ./types
