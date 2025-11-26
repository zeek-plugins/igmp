# Spicy-based Zeek IGMP packet analyzer :hot_pepper:

This repository contains a [Zeek](https://zeek.org/) packet analyzer for the [IGMP protocol](https://en.wikipedia.org/wiki/Internet_Group_Management_Protocol), based on [Spicy](https://docs.zeek.org/projects/spicy/en/latest/index.html).
It is packed as a Zeek package, which can be easily installed with [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/).

The IGMP protocol is defined in the following RFCs:
- IGMPv1: [RFC 1112](https://datatracker.ietf.org/doc/html/rfc1112)
- IGMPv2: [RFC 2236](https://datatracker.ietf.org/doc/html/rfc2236)
- IGMPv3: [RFC 3376](https://datatracker.ietf.org/doc/html/rfc3376)


## Getting the package

### :loudspeaker: News: Present natively in Zeek >= 9.0

The IGMP package has been included in the Zeek codebase as of version 9.0,
so if you run this version or higher,
you don't have to install it,
just profit !

Consult the section [Using the package](#using-the-package) below
for usage instructions.


### Installation (Zeek version < 9.0)

#### Prerequisites

Before trying to install the package, make sure you have the following tools installed:

- [Zeek](https://zeek.org/)
- [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/) command `zkg`
- [Spicy plugin](https://docs.zeek.org/projects/spicy/en/latest/index.html) for Zeek

Everything should be installed correctly if you install the latest [Zeek](https://zeek.org/) version.


#### Setup

A simple call to `make install` from the repository's root directory should install the package and run unit tests.
You can also use the `zkg` command directly:
```shell
zkg install https://github.com/zeek-plugins/igmp  # to install as super user
zkg --user install https://github.com/zeek-plugins/igmp  # to install in user space
```

You might have to update the `ZEEKPATH` and `ZEEK_PLUGIN_PATH` environmental variables.
To see which value they should take, run the following commands:
```shell
zkg env         # For the super user
zkg --user env  # For a normal user
```

To confirm that installation was successful, you can run the following command:
```shell
zeek -NN | grep IGMP
```

If the command's output shows something similar to:
```
[Packet Analyzer] Spicy::IGMP (ANALYZER_SPICY__IGMP)
```
the package was correctly installed, and you have access to the IGMP packet analyzer.

In the case of any installation problems, please check the [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/) documentation.


## Using the package

Once the Zeek package installed, you will be able to use the IGMP packet analyzer in your Zeek scripts.
You will have to explicitly load the package scripts in the beginning of your Zeek scripts with the following instruction:
```zeek
@load /path/to/igmp/scripts
```
If you updated the `ZEEKPATH` environment variable as explained before, the path should simply be `igmp`.


### Types

The plugin defines the following types:
```zeek
IGMP::IgmpMessageType: enum {
  MEMBERSHIP_QUERY     = 0x11,
  MEMBERSHIP_REPORT_V1 = 0x12,
  MEMBERSHIP_REPORT_V2 = 0x16,
  LEAVE_GROUP          = 0x17,
  MEMBERSHIP_REPORT_V3 = 0x22,
  BAD_CHECKSUM         = 0x00
}
```
- Represents an IGMP Message Type.
- This plugin includes a dummy IGMP message type, `IGMP::BAD_CHECKSUM`, that is indicated when checksum verification failed on the message.

```zeek
IGMP::MulticastGroup: record {
  group_type:     GroupType;
  aux_data_len:   count;
  num_sources:    count;
  multicast_addr: addr;
  sources:        vector of addr;
  aux_data:       string;
}
```
- Represents an IGMPv3 Multicast Group.

```zeek
IGMP::GroupType: enum {
  MODE_IS_INCLUDE        = 1,
  MODE_IS_EXCLUDE        = 2,
  CHANGE_TO_INCLUDE_MODE = 3,
  CHANGE_TO_EXCLUDE_MODE = 4,
  ALLOW_NEW_SOURCES      = 5,
  BLOCK_OLD_SOURCES      = 6
}
```
- Represents an IGMPv3 Multicast Group type.

Please consult [RFC 1112](https://datatracker.ietf.org/doc/html/rfc1112) (IGMPv1), [RFC 2236](https://datatracker.ietf.org/doc/html/rfc2236) (IGMPv2) and [RFC 3376](https://datatracker.ietf.org/doc/html/rfc3376) (IGMPv3) for more information.


### Events

The plugin defines the following events:
- `event igmp::message(pkt_hdr: raw_pkt_hdr, msg_type: IGMP::IgmpMessageType)`
  - Triggered upon reception of any IGMP message.
- `event igmp::membership_query(pkt_hdr: raw_pkt_hdr, group_addr: addr)`
  - Triggered upon reception of a IGMP Membership Query message.
- `event igmp::membership_report_v1(pkt_hdr: raw_pkt_hdr, group_addr: addr)`
  - Triggered upon reception of a IGMP Version 1 Membership Report message.
- `event igmp::membership_report_v2(pkt_hdr: raw_pkt_hdr, group_addr: addr)`
  - Triggered upon reception of a IGMP Version 2 Membership Report message.
- `event igmp::leave_group(pkt_hdr: raw_pkt_hdr, group_addr: addr)`
  - Triggered upon reception of a IGMP Version 2 Leave Group message.
- `event igmp::membership_report_v3(pkt_hdr: raw_pkt_hdr, num_groups: count, groups: vector of IGMP::MulticastGroup)`
  - Triggered upon reception of a IGMP Version 3 Membership Report message.
- `event igmp::bad_checksum(pkt_hdr: raw_pkt_hdr, transmitted_checksum: count, computed_checksum: count)`
  - Triggered upon reception of a IGMP message which failed checksum verification.


### Logging

The plugin automatically logs all the IGMP traffic that it sees, and writes it into the `igmp.log` file.
For every message, it logs the following information:
- Timestamp
- Source IPv4 address
- Destination IPv4 address
- IGMP message type (see the aforementioned RFCs for more information)
  - This analyzer includes a dummy IGMP message type, `IGMP::BAD_CHECKSUM`, that is indicated when checksum verification failed on the message.


## License

This project is licensed under the BSD license. See the [LICENSE](LICENSE) file for details.


## Contributors

- François De Keersmaeker
  - GitHub: [@fdekeers](https://github.com/fdekeers)
  - Email: francois.dekeersmaeker+github@proton.me
