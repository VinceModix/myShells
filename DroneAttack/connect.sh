#!/bin/bash
service network-manager stop
service networking stop
killall wpa_supplicant
killall dhclient
ifconfig wlan1 down
iwconfig wlan1 essid ardrone2_
ifconfig wlan1 up