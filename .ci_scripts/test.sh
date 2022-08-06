#!/bin/bash

set -e

function debug_and_die {
    OUTPUT_PATH=$HOME/.zkg/testing/mdns/clones/mdns
    if [ -s $OUTPUT_PATH/zkg.test_command.stdout ]; then
	echo "zkg test command stdout"
	echo "-----------------------"
	cat $OUTPUT_PATH/zkg.test_command.stdout
    fi

    if [ -s $OUTPUT_PATH/zkg.test_command.stderr ]; then
	echo "zkg test command stderr"
	echo "-----------------------"
	cat $OUTPUT_PATH/zkg.test_command.stderr
    fi

    if [ -s $HOME/.zkg/logs/mdns-build.log ]; then
	echo "zkg build command output"
	echo "-----------------------"
	cat $HOME/.zkg/logs/mdns-build.log
    fi

    exit 1
}

export PATH="/opt/zeek/bin:/opt/zeek/bin:$PATH"

echo "Running zkg install..."
zkg install --force "$PWD" || debug_and_die
echo "Install succeeded."

