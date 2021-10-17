# Route all packets to 10.85.174.0/24 via default GW 192.168.193.4 and interface tap0
sudo ip route add 10.85.174.0/24 via 192.168.193.4 dev tap0
