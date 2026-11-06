# Configure eth0 with IP in the VXLAN overlay network
ip addr add 30.1.1.2/24 dev eth0
ip link set eth0 up
