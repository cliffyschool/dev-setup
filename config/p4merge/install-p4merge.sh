#!/bin/sh
# download p4v*.tgz first

tar -xzvf p4v*.tgz
sudo mv p4v* /usr/local/p4v
cd /usr/local/bin
sudo ln -s ../p4v/p4merge p4merge

