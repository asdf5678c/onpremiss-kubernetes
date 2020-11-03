FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -y openssh-server
RUN apt-get install -y openssh-client
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping net-tools
CMD /etc/init.d/ssh start \
 && cd /root \
 && rm -f .ssh \
 && mkdir .ssh \
 && cd .ssh \
 && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa_master03 \
 && sed -i -e 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
 && sed -i -e 's/ChallengeResponseAuthentication no/# ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config \
 && sed -i -e 's/# net.ipv4.conf.all.secure_redirects = 1/net.ipv4.conf.all.secure_redirects = 1/g' /etc/sysctl.conf \
 && echo "root:passwd" | chpasswd \
 && sysctl -w net.ipv4.ip_forward=1 \
 && /etc/init.d/ssh restart \
 && /bin/bash


