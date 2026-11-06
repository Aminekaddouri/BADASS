# Simple host machine based on Alpine Linux
# Alpine includes busybox by default
# busybox-extras adds networking tools like telnet
FROM alpine:3.19

RUN apk update && apk add --no-cache \
    busybox-extras \
    iputils

# Keep the container running with a shell for GNS3 console access
CMD ["/bin/sh"]
