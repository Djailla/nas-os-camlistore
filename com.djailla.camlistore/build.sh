#!/bin/bash

mkdir -m 755 -p /opt/camlistore/
install -m 755 /home/source/rc.local /etc

# Install Golang
apt-get update
apt-get install -y -q golang git

# Checkout sources in /opt
cd /opt/
git clone https://camlistore.googlesource.com/camlistore
cd /opt/camlistore/

# Build the package
go run make.go

exit 0
