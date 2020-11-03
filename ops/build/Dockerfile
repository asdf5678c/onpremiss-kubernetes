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
RUNpip install --upgrade pip setuptools
RUN pip install ansible
RUN pip install netaddr
RUN apt-get install -y git
CMD /etc/init.d/ssh start \
 && cd /root \
 && if [ -e .ssh ]; then rm -f .ssh; fi \
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
 && declare -a IPS=(172.23.0.2 172.23.0.3 172.23.0.4 172.23.0.5) \
 && echo "exit()" | CONFIG_FILE=inventory/mycluster/hosts.ini python3 \
 && chmod 755 contrib/inventory_builder/inventory.py \
 && contrib/inventory_builder/inventory.py ${IPS[@]} \
 && /bin/bash

pip install ansible‚Å
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 0: ordinal not in range(128)
https://qiita.com/kaitaku/items/073f17cc6e5112e4cdf7