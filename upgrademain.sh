#!/bin/bash

set -e

echo "Stopping Kusama node service..."
sudo systemctl stop polkadot.service

echo "Updating Polkadot SDK repository..."
cd $HOME/polkadot-sdk
git fetch
git checkout polkadot-v1.17.2

echo "Rebuilding Polkadot..."
cargo build --release

echo "Restarting Kusama node service..."
sudo systemctl restart polkadot.service

echo "📄 Showing live logs:"
sudo journalctl -u polkadot.service -f
