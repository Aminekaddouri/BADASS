# Loopback - Router ID for OSPF and BGP
ip addr add 1.1.1.1/32 dev lo
ip link set lo up

# eth0 - link to _akaddour-2
ip addr add 10.1.1.1/30 dev eth0
ip link set eth0 up

# eth1 - link to _akaddour-3
ip addr add 10.1.1.5/30 dev eth1
ip link set eth1 up

# eth2 - link to _akaddour-4
ip addr add 10.1.1.9/30 dev eth2
ip link set eth2 up
