FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Create ansible user with sudo privileges
RUN useradd -m -s /bin/bash ansible && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set up SSH for ansible user
RUN mkdir -p /home/ansible/.ssh
COPY ansible_ssh_key.pub /home/ansible/.ssh/authorized_keys
RUN chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    chmod 600 /home/ansible/.ssh/authorized_keys && \
    chmod 755 /home/ansible

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

# Also allow root login with SSH key (optional, for debugging)
RUN mkdir -p /root/.ssh
COPY ansible_ssh_key.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys

RUN apt-get install -y --no-install-recommends \
    ca-certificates openssl bash curl git ttyd \
    python3 python3-pip && \
    update-ca-certificates

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]