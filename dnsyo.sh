#!/bin/bash
sudo apt-get update
sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:fkrull/deadsnakes-python2.7
sudo apt-get update
sudo apt-get upgrade -y --force-yes
sudo apt-get install -y build-essential python-pip
sudo pip install dnsyo --upgrade
sudo apt-get autoremove && sudo apt-get autoclean

wget --no-check-certificate -O ~/nameservers.txt https://public-dns.info/nameservers.txt
sed -i '/:/d' nameservers.txt
for ((n=0; n<=5; n++)) do sort -R nameservers.txt -o nameservers.txt; done
head -1000 nameservers.txt >.dnsyo-resovers-list.yaml
sed -i 's/^/- country: US\n  ip: &/g' .dnsyo-resovers-list.yaml


