#!/bin/bash

mkdir -m 755 -p /opt/camlistore/config
install -m 755 /home/source/rc.local /etc
install -m 755 /home/source/server-config.json /opt/camlistore/config/
install -m 755 /home/source/update_identity.py /opt/camlistore/

# Install Git
apt-get update
apt-get install -y -q git

if [ $RAINBOW_ARCHITECTURE = "x86_64" ]
then
# Install Golang
    cd /tmp
    wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
else
    echo "No ARM compatible version"
    exit 1
fi

# Checkout sources in /opt
cd /tmp
git clone https://camlistore.googlesource.com/camlistore

# Build the package
cd /tmp/camlistore/
go run make.go

mv /tmp/camlistore/bin/ /opt/camlistore/

rm -rf /usr/local/go
rm -rf /tmp/*

exit 0
