FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -y openssh-server
RUN apt-get install -y openssh-client
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping net-tools
CMD /etc/init.d/ssh start \
 && cd /root \
 && mkdir .ssh \
 && cd .ssh \
 && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa_master01 \
 && sed -i -e 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
 && sed -i -e 's/ChallengeResponseAuthentication no/# ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config \
 && echo "root:passwd" | chpasswd \
 && /etc/init.d/ssh restart \
 && /bin/bash


