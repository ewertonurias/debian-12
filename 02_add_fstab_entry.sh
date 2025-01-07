#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    printf "Este script precisa ser executado como root.\n"
    exit 1
fi

# Criando diretório games em /mnt
printf "Criando o caminho /mnt/games...\n"
sudo mkdir /mnt/games

# Caminho do arquivo /etc/fstab
FSTAB_FILE="/etc/fstab"

# Entrada a ser adicionada
NEW_ENTRY="UUID=f4525d07-661d-4c65-92b5-4dfaddf54c51 /mnt/games      ext4    defaults        0       0"

# Faz um backup do /etc/fstab para a pasta pessoal do usuário
BACKUP_FILE=~/fstab.bak
printf "Fazendo backup do arquivo %s para %s...\n" "$FSTAB_FILE" "$BACKUP_FILE"
cp "$FSTAB_FILE" "$BACKUP_FILE"

# Verifica se a entrada já existe no arquivo
if grep -Fxq "$NEW_ENTRY" "$FSTAB_FILE"; then
    printf "A entrada já existe no arquivo %s. Nenhuma alteração foi feita.\n" "$FSTAB_FILE"
else
    # Adiciona a nova entrada ao final do arquivo
    printf "Adicionando a nova entrada ao final do arquivo %s...\n" "$FSTAB_FILE"
    printf "%s\n" "$NEW_ENTRY" >> "$FSTAB_FILE"
    printf "Nova entrada adicionada com sucesso.\n"
    printf "Reinicie o sistema para que as alterações entrem em vigor.\n"
fi
