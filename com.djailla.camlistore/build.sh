#!/bin/bash

mkdir -m 755 -p /opt/camlistore/
install -m 755 /home/source/rc.local /etc

# Install Git
apt-get update
apt-get install -y -q git

# Install Golang
cd /tmp
wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Checkout sources in /opt
cd /opt/
git clone https://camlistore.googlesource.com/camlistore

# Build the package
cd /opt/camlistore/
go run make.go

exit 0
