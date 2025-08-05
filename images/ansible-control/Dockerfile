FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates openssl bash curl git ttyd \
    python3 python3-pip openssh-client \
    && update-ca-certificates

RUN apt-get install -y --no-install-recommends \
    ansible

COPY ansible_ssh_key /root/.ssh/id_ed25519
COPY ansible_ssh_key.pub /root/.ssh/id_ed25519.pub

RUN chmod 600 /root/.ssh/id_ed25519 && \
    chmod 644 /root/.ssh/id_ed25519.pub

# Utilities
RUN apt-get install -y --no-install-recommends \
    iputils-ping traceroute iputils-ping net-tools

ENTRYPOINT [ "ttyd" ]
CMD [ "-p", "7681", "--writable", "bash", "-li" ]