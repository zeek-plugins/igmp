# TODO: Use this file to optionally declare signatures which can be used to activate your analyzers.
# Not needed for IGMP since it is a Layer-4 protocol.
#
# signature dpd_Message {
#     ip-proto == tcp
#     payload /^\x11\x22\x33\x44/
#     enable "spicy_Message"
# }
