#!/bin/sh

# Detect the OS type
OS=$(uname)

# Define the network and gateway
NETWORK="172.29.248.0/22"
GATEWAY="192.168.1.64"

if [ "$OS" = "Darwin" ]; then
    # macOS commands
    echo "Detected macOS"
    sudo route -n delete -net $NETWORK $GATEWAY
    sudo route -n add -net $NETWORK $GATEWAY
elif [ "$OS" = "Linux" ]; then
    # Linux commands
    echo "Detected Linux"
    sudo ip route delete $NETWORK via $GATEWAY
    sudo ip route add $NETWORK via $GATEWAY
else
    echo "Unsupported OS: $OS"
    exit 1
fi
