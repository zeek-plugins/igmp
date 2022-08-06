#!/bin/bash

export PATH="/opt/zeek/bin:/opt/zeek/bin:$PATH"

pip3 install -U zkg
zkg autoconfig
