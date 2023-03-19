# pulse-client-container
Rootless Podman container for running Pulse Secure VPN Client accesible as an SSH jumphost.

## Usage

Start the container in podman

~~~ sh
podman run -d \
 --name pulse-client \
 --volume=/tmp/.X11-unix:/tmp/.X11-unix \
 --volume=/path/to/pulse/data:/var/lib/pulsesecure/pulse \
 --cap-add=NET_ADMIN \ #Required to allow access to /dev/net/tun
 --device=/dev/net/tun \
 --security-opt="label=disable" \ #Required to allow access to /dev/net/tun
 --env=DISPLAY=host.containers.internal:0 \
 -p 8023:22 \
 --dns=10.88.0.1 \ #replace with your podman host IP
 ghcr.io/tony-robson/pulse-client-container
~~~


