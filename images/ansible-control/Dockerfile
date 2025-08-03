FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates openssl bash curl git ttyd \
    python3 python3-pip openssh-client \
    && update-ca-certificates

RUN apt-get install -y --no-install-recommends \
    ansible

COPY ansible.cfg /etc/ansible/ansible.cfg

ENTRYPOINT [ "ttyd" ]
CMD [ "-p", "7681", "--writable", "bash", "-li" ]