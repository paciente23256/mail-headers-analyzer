#!/usr/bin/env bash
#autor: @paciente23256

DEPENDENCIAS="python3 python3-pip"

if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then

    sudo apt update -y
    sudo apt-get install $DEPENDENCIAS -y
    sudo pip3 install virtualenv
    git  -c http.sslVerify=false clone https://git.pj.priv/rventura/email-analyzer.git /var/mail-analyzer
    cd /var/mail-analyzer
    sudo virtualenv virt
    sudo source virt/bin/activate
    sudo pip3 install -r requirements.txt
    sudo cp linux-daemon/mail-analyzer.service /etc/systemd/system/mail-analyzer.service
    sudo chomd 755 /etc/systemd/system/mail-analyzer.service
    sudo systemctl daemon-reload
    sudo systemctl start mail-analyzer.service
    sudo systemctl status mail-analyzer.service
   
   
elif [ "$(grep -Ei 'redhat|centos' /etc/*release)" ]; then 
    os_version=$(cut -d ':' -f5 < /etc/system-release-cpe)
    if [ "$os_version" == 8 ]; then
        sudo dnf install https://extras.getpagespeed.com/release-el8-latest.rpm -y
        sudo dnf install $DEPENDENCIAS -y
        sudo pip3 install virtualenv
        git  -c http.sslVerify=false clone https://git.pj.priv/rventura/email-analyzer.git /var/mail-analyzer
        cd email-analyzer
        sudo virtualenv virt
        sudo source virt/bin/activate
        sudo pip3 install -r requirements.txt
        cd /var/mail-analyzer
        sudo pip3 install -r requirements.txt
        sudo cp linux-daemon/mail-analyzer.service /etc/systemd/system/mail-analyzer.service
        sudo chomd 755 /etc/systemd/system/mail-analyzer.service
        sudo systemctl daemon-reload
        sudo systemctl start mail-analyzer.service
        sudo systemctl status mail-analyzer.service
   
   
   
    elif [ "$os_version" == 7 ]; then
        sudo rpm -Uvh http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-release-1.0-20.el7.art.noarch.rpm
        sudo rpm  -Uvh http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-release-1.0-21.art.noarch.rpm
        sudo rpm -Uvh  http://www6.atomicorp.com/channels/atomic/centos/7/x86_64/RPMS/atomic-release-1.0-21.art.noarch.rpm
        sudo yum install $DEPENDENCIAS -y
        sudo pip3 install virtualenv
        git  -c http.sslVerify=false clone https://git.pj.priv/rventura/email-analyzer.git /var/mail-analyzer
        cd email-analyzer
        sudo pip3 install -r requirements.txt
        sudo virtualenv virt
        sudo source virt/bin/activate
        sudo cp linux-daemon/mail-analyzer.service /etc/systemd/system/mail-analyzer.service
        sudo chomd 755 /etc/systemd/system/mail-analyzer.service
        sudo systemctl daemon-reload
        sudo systemctl start mail-analyzer.service
        sudo systemctl status mail-analyzer.service
        


    fi  
fi