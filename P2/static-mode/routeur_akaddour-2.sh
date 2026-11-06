# Give eth0 an IP address (opposite end of the link)
ip addr add 10.1.1.2/30 dev eth0
ip link set eth0 up

# Give the loopback an IP
ip addr add 1.1.1.2/32 dev lo
ip link set lo up

# Create the VXLAN interface (remote points to routeur-1)
ip link add vxlan10 type vxlan id 10 dstport 4789 remote 10.1.1.1 local 10.1.1.2 dev eth0

# Create the bridge
ip link add br0 type bridge

# Attach VXLAN and eth1 to the bridge
ip link set vxlan10 master br0
ip link set eth1 master br0

# Bring everything up
ip link set vxlan10 up
ip link set br0 up
ip link set eth1 up