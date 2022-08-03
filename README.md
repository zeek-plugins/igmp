# Spicy-based Zeek IGMP packet analyzer :hot_pepper:

This repository contains a [Zeek](https://zeek.org/) packet analyzer for the [IGMP protocol](https://en.wikipedia.org/wiki/Internet_Group_Management_Protocol), based on [Spicy](https://docs.zeek.org/projects/spicy/en/latest/index.html).
It is packed as a Zeek package, which can be easily installed with [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/).

## Installation

### Prerequisites

Before trying to install the package, make sure you have the following tools installed:

- [Zeek](https://zeek.org/)
- [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/) command `zkg`
- [Spicy plugin](https://docs.zeek.org/projects/spicy/en/latest/index.html) for Zeek

Everything should be installed correctly if you install the latest [Zeek](https://zeek.org/) version.

### Setup

A simple call to `make install` from the repository's root directory should install the package and run unit tests.
You can also use the `zkg` command directly:
```bash
zkg install $REPOSITORY_ROOT_DIRECTORY
```

In the case of any installation problems, please check the [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/) documentation.


## Usage



## Contributors

- François De Keersmaeker
  - GitHub: [@fdekeers](https://github.com/fdekeers)
  - Email: francois.dekeersmaeker@uclouvain.be