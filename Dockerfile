# Use Rockylinux 9 (RHEL/CentOS Compat) as base image
FROM rockylinux:9

COPY ./pulse.rpm .

# Install Pulse dependencies
 
RUN dnf -y install epel-release && \
yum install -y systemd iputils net-tools iproute dnsmasq libbsd webkit2gtk3 gtkmm30 libXScrnSaver nss-tools openssh-server && \
yum clean all

# Install Pulse Client    
RUN rpm -i ./pulse.rpm

# add user
ENV USER_ID 1000
ENV GROUP_ID 1000
RUN groupadd --gid $GROUP_ID pulse && \
useradd --uid $USER_ID --gid $GROUP_ID --comment pulse --home-dir /data --no-create-home pulse && \
echo 'pulse:pulse' | chpasswd && \
mkdir /data

# Use systemd as command
CMD [ "/usr/sbin/init" ]

COPY ./pulse_startup.sh /usr/sbin/
COPY ./pulsestartup.service /etc/systemd/system/
RUN chmod +x /usr/sbin/pulse_startup.sh && \
chmod 644 /etc/systemd/system/pulsestartup.service && \
systemctl enable pulsestartup.service
#systemctl enable sshd.service

EXPOSE 22

#WORKDIR /data

