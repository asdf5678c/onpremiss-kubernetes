FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -y openssh-server
RUN apt-get install -y openssh-client
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping net-tools
RUN apt-get install -y python-pip python3-pip
RUN pip install --upgrade pip
RUN easy_install -U setuptools
RUN pip install ansible
RUN pip install netaddr
RUN apt-get install -y git
CMD /etc/init.d/ssh start \
 && cd /root \
 && rm -f .ssh \
 && mkdir .ssh \
 && cd .ssh \
 && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa_ops \
 && sed -i -e 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
 && sed -i -e 's/ChallengeResponseAuthentication no/# ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config \
 && sed -i -e 's/# net.ipv4.conf.all.secure_redirects = 1/net.ipv4.conf.all.secure_redirects = 1/g' /etc/sysctl.conf \
 && echo "root:passwd" | chpasswd \
 && sysctl -w net.ipv4.ip_forward=1 \
 && /etc/init.d/ssh restart \
 && git clone https://github.com/kubernetes-incubator/kubespray \
 && cd kubespray && git checkout v2.5.0  && pip install -r requirements.txt \
 && cp -rfp inventory/sample inventory/mycluster \
 && declare -a IPS=(master01 master02 master03 node01) \ #‚±‚±‚ðIPŒˆ‚ß‘Å‚¿‚É’¼‚·‚±‚Æ
 && echo "exit()" | CONFIG_FILE=inventory/mycluster/hosts.ini python3 \
 && /bin/bash
# && ssh-copy-id -i ~/.ssh/id_rsa_master01.pub ops \

