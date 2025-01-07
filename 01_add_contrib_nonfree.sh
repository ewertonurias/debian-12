 #!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    printf "Este script precisa ser executado como root.\n"
    exit 1
fi

# Caminho do arquivo sources.list
SOURCES_LIST="/etc/apt/sources.list"

# Faz um backup do /etc/apt/sources.list para a pasta pessoal do usuário
BACKUP_FILE=~/sources.list.bak
printf "Fazendo backup do arquivo %s para %s...\n" "$SOURCES_LIST" "$BACKUP_FILE"
cp "$SOURCES_LIST" "$BACKUP_FILE"

# Excluindo o arquivo original
printf "Excluindo o arquivo original...\n"
rm "$SOURCES_LIST"

# Gerando novo sources.list
printf "Gerando novo arquivo com 'contrib' e 'non-free' em %s...\n" "$SOURCES_LIST"

# Para Debian 12 (bookworm), ajuste conforme sua versão
cat <<EOL >> $SOURCES_LIST
deb http://deb.debian.org/debian/ bookworm main non-free-firmware contrib non-free
deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware contrib non-free

deb http://security.debian.org/debian-security bookworm-security main non-free-firmware contrib non-free
deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware contrib non-free

# bookworm-updates, to get updates before a point release is made;
# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware contrib non-free
deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware contrib non-free

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.
EOL

printf "%s com 'contrib' e 'non-free' gerado com sucesso!\n" "$SOURCES_LIST"

# Atualizando os pacotes
printf "Atualizando pacotes...\n"
apt update
