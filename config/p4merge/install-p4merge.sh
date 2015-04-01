#!/bin/sh
wget http://www.perforce.com/downloads/perforce/r14.3/bin.linux26x86_64/p4v.tgz -O p4v.tgz
tar -xzvf p4v.tgz
sudo mv p4v* p4v
sudo mv "p4v-2014.3.1007540" "/usr/local/p4v"
cd /usr/sbin
sudo ln -s /usr/local/p4v/bin/p4merge p4merge

