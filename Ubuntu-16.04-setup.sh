#!/bin/bash
###### Install pentesting tools for Ubuntu 16.04 LTS #######

echo "Run the script as root user"


echo "System Updates"
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

echo "Cleaning up some default Ubuntu applications"
apt-get remove -y --purge rhythmbox ekiga totem* ubuntu-one* unity-lens-music unity-lens-friends unity-lens-photos unity-lens-video transmission* thunderbird* apport

echo "Remove search tools provided by unity."
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search none

echo "Disable guest user and remote logon"
sh -c 'printf "[SeatDefaults]\ngreeter-show-remote-login=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-remote-login.conf'
sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'

echo "Tools install"
apt-get install -y nmap nbtscan dsniff tcpdump john p7zip openjdk-7-jre openvpn libwebkitgtk-1.0-0 libssl-dev vim macchanger libnl-dev yersinia meld

echo "Add Repository for Development Wireshark"
apt-add-repository ppa:dreibh/ppa
apt-get update && apt-get -y install wireshark tshark
