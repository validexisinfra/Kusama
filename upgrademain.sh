#!/bin/bash

set -e

echo "Stopping Kusama node service..."
sudo systemctl stop kusama.service

echo "Updating Polkadot SDK repository..."
cd $HOME/polkadot-sdk
git fetch
git checkout polkadot-v1.20.1

echo "Rebuilding Polkadot..."
cargo build --release

echo "Restarting Kusama node service..."
sudo systemctl restart kusama.service

echo "📄 Showing live logs:"
sudo journalctl -u kusama.service -f
