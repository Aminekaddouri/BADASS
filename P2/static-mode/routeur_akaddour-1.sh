# Give eth0 an IP address (the side facing the switch - underlay network)
ip addr add 10.1.1.1/30 dev eth0
ip link set eth0 up

# Give the loopback an IP (used as VTEP identifier)
ip addr add 1.1.1.1/32 dev lo
ip link set lo up

# Create the VXLAN interface
ip link add vxlan10 type vxlan id 10 dstport 4789 remote 10.1.1.2 local 10.1.1.1 dev eth0


# Create bridge br0 - connects VXLAN tunnel to host-facing port
ip link add br0 type bridge

# Attach VXLAN and eth1 (host-facing) to bridge
ip link set vxlan10 master br0
ip link set eth1 master br0

# Bring all interfaces up
ip link set vxlan10 up
ip link set br0 up
ip link set eth1 up
