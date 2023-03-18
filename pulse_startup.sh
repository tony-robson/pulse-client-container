# fix user id if needed
usermod --uid "1000" --gid "1000" pulse

#Fix home dir ownership
chown -R "1000:1000" /data

#tail -f /var/log/pulsesecure/logging/PulseClient.log | while read -r line; do
#    # cut off first two blocks of the log message
#    line="${line#* * }"
#    echo "${line}"
#    # keep the tunnel open by sending a ping message every 5 min to the gateway
#    if [[ "${line}" =~ ^adapter.info\ cip\ =\ [^,]+,\ mask\ =\ [^,]+,\ gw\ =\ ([^,]+), ]]; then
#        ping -i 300 -- "${BASH_REMATCH[1]}" | while read -r line; do
#            echo "keepalive.info ${line}"
#        done &
#    fi
#done

# Start PulseUI
export DISPLAY=host.containers.internal:0
exec su -c /opt/pulsesecure/bin/pulseUI pulse
