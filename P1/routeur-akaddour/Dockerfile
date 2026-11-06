FROM frrouting/frr:v8.4.1

RUN apk update && apk add --no-cache \
    busybox-extras \
    iputils

RUN sed -i 's/^bgpd=no/bgpd=yes/' /etc/frr/daemons && \
    sed -i 's/^ospfd=no/ospfd=yes/' /etc/frr/daemons && \
    sed -i 's/^isisd=no/isisd=yes/' /etc/frr/daemons

CMD ["/bin/bash", "-c", "/usr/lib/frr/docker-start & exec /bin/bash"]
# CMD ["/usr/lib/frr/docker-start"]

# docker run --rm --privileged -d routeur-akaddour
# docker exec $(docker ps -q --filter ancestor=routeur-akaddour) ps
# docker run --rm routeur_akaddour cat /etc/frr/daemons | grep -E "bgpd|ospfd|isisd"


docker load -i ~/badass/P1/host-akaddour.tar
docker load -i ~/badass/P1/routeur-akaddour.tar