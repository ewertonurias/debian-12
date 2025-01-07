#!/bin/bash

# Instalando o TLP
printf "Instalando o TLP...\n"
sudo apt install -y tlp

# Ativando o serviço
printf "Ativando o servico...\n"
sudo systemctl start tlp.service

# Habilitando o TLP no boot
printf "Habilitando o TLP para iniciar com o sistema...\n"
sudo systemctl enable tlp.service

# Verificando o estado do TLP
printf "Verificando se o TLP está ativo...\n"
sudo tlp-stat -s

### Caso esteja longe de uma tomada e queira jogar,
### desative temporariamente o TLP enquanto joga com o comando:
### sudo tlp ac
### Isso força o perfil de desempenho como se estivesse na tomada,
### mesmo que esteja na bateria.
### Para reativar o TLP normal depois:
### sudo tlp start
