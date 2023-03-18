# pulse-client-container
Rootless Podman container for running Pulse Secure VPN Client accesible as an SSH jumphost.

## Usage

Start the container in podman

~~~ sh
podman run -d \
 --name pulse-client \
 --volume=/tmp/.X11-unix:/tmp/.X11-unix \
 --cap-add=net_admin \
 --device=/dev/net/tun \
 --security-opt="label=disable" \
 --env=DISPLAY=host.containers.internal:0 \
 -p 8022:22 \
 --dns=10.88.0.1 \
 localhost/pulse-client
~~~


