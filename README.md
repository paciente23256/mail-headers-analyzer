# Email Header Analyzer
### Analise de cabeçalhos de Correio Electrónico

O Email Header Analyzer é uma ferramenta escrita em flask para analisar cabeçalhos de correio eletrónico e convertê-los para um formato legível por humanos e também pode:

* Identificar atrasos nos saltos.
* Identificar a origem do correio eletrónico.
* Identificar o país do salto.

<center><img src="https://github.com/paciente23256/mail-headers-analyzer/-/raw/main/static/imgs/header_results.png">
</center>

<a target="_blank" href="https://en.wikipedia.org/wiki/Python_(programming_language)">
<img src="https://img.shields.io/static/v1?label=python&message=3.10%20|%203.12&color=informational&logo=python"/>
</a>
<p></p>

## Instalação Linux Debian

**Dependências:** 

    sudo apt-get update -y && sudo apt install python3 python3-pip -y
    sudo pip3 install virtualenv


## Instalação Linux RedHat

**Dependências:** 

    sudo dnf update -y && sudo dnf install python3 python3-pip -y
    sudo pip3 install virtualenv


**Passo  1:** Crie um ambiente virtual Python3 e active-o:

    virtualenv virt
    source virt/bin/activate

**Passo  2:** Clone o repositorio:
     
     git clone https://github.com/paciente23256/mail-headers-analyzer.git /var/mail-analyzer/


**Passo  3:** Instalar as dependências do Python:

    cd /var/mail-analyzer/
    pip3 install -r requirements.txt

**Passo  4:** Executar o servidor:

    sudo python3 /var/mail-analyzer/server.py -d
Pode alterar o endereço ou a porta de ligação especificando as opções adequadas: 

    sudo python3 /var/mail-analyzer/server.py -b 0.0.0.0 -p 8888

Por fim pode abrir o browser no endereço especificado
    http://localhost:8888

**Auto Setup :** 

     sudo wget -O - https://github.com/paciente23256/mail-headers-analyzer/-/raw/main/setup.sh | bash 

**Ou:**

    cd /var/mail-analyzer/
    sudo chmod +x setup.sh
    sudo ./setup.sh

No browser abrir o endereço especificado

    http://localhost:8888
    
    http://ip:8888


<center><img src="https://github.com/paciente23256/mail-headers-analyzer/-/raw/main/static/imgs/header_start.png"></center>


**Daemon service :**

<center><img src="https://raw.githubusercontent.com/paciente23256/mail-headers-analyzer/master/linux-daemon/daemon.service.png"></center>

