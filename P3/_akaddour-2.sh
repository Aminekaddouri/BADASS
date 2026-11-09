# Loopback - Router ID and local VTEP IP
ip addr add 1.1.1.2/32 dev lo
ip link set lo up

# eth0 - link to RR (_akaddour-1)
ip addr add 10.1.1.2/30 dev eth0
ip link set eth0 up

# VXLAN tunnel - nolearning means BGP EVPN handles MAC learning
ip link add vxlan10 type vxlan id 10 dstport 4789 local 1.1.1.2 nolearning

# Bridge - connects VXLAN tunnel to host-facing port eth1
ip link add br0 type bridge
ip link set vxlan10 master br0
ip link set eth1 master br0
ip link set vxlan10 up
ip link set br0 up
ip link set eth1 up
