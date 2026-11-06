# Configure eth0 - underlay network (connects to switch)
ip addr add 10.1.1.2/30 dev eth0
ip link set eth0 up

# Configure loopback - VTEP identifier
ip addr add 1.1.1.2/32 dev lo
ip link set lo up

# Create VXLAN interface with multicast group 239.1.1.1 and VNI 10
ip link add vxlan10 type vxlan id 10 dstport 4789 group 239.1.1.1 dev eth0

# Create bridge br0 - connects VXLAN tunnel to host-facing port
ip link add br0 type bridge

# Attach VXLAN and eth1 (host-facing) to bridge
ip link set vxlan10 master br0
ip link set eth1 master br0

# Bring all interfaces up
ip link set vxlan10 up
ip link set br0 up
ip link set eth1 up
