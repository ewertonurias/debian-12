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
