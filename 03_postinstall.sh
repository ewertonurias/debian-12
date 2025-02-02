#!/bin/bash

# Habilitando arquitetura 32 bits
printf "Habilitando arquitetura i386...\n"
sudo dpkg --add-architecture i386 && sudo apt update
printf "Arquitetura i386 adicionada.\n"

# Instalando bibliotecas 32 bits para maximizar compatibilidade com programas e jogos 32 bits
printf "Instalando libs32 para maximizar compatibilidade com programas e jogos 32 bits...\n"
sudo apt install -y lib32gcc-s1 lib32stdc++6

# Instalando aplicativos essenciais
printf "Instalando aplicativos essenciais...\n"
sudo apt install -y btop cpu-x feh inkscape inxi kcolorchooser kdenlive kdf kget krita neofetch paprefs p7zip-rar qbittorrent ristretto telegram-desktop mpv

# Instalando aplicativos de jogos
printf "Instalando aplicativos de jogos...\n"
sudo apt install -y steam mangohud

# Instalando o wine
printf "Instalando o wine...\n"
sudo apt install -y wine

# Instalando fontes Microsoft
printf "Instalando fontes Microsoft...\n"
sudo apt install -y ttf-mscorefonts-installer

# Instalando Flatpak e adicionando o repositório Flathub
printf "Instalando o Flatpak e adicionando o repositório Flathub...\n"
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalando o gerenciador de Flatpaks
printf "Instalando o gerenciador de Flatpaks Armazen...\n"
flatpak install -y flathub io.github.flattool.Warehouse

# Instalando o Flatpak Discord
printf "Instalando o Flatpak Discord...\n"
flatpak install -y flathub com.discordapp.Discord

# Instalando o Flatpak ProtonUp-Qt
printf "Instalando o Flatpak ProtonUp-Qt...\n"
flatpak install -y flathub net.davidotek.pupgui2

# Instalando o Flatpak Protontricks
printf "Instalando o Flatpak Protontricks e adicionando permissao para /mnt/games/SteamLibrary...\n"
flatpak install -y flathub com.github.Matoking.protontricks
flatpak override --user --filesystem=/mnt/games/SteamLibrary com.github.Matoking.protontricks

# Instalando o Flatpak Flatseal
printf "Instalando o Flatpak Flatseal para configurar permissoes...\n"
flatpak install -y flathub com.github.tchx84.Flatseal

# Buscando novas atualizações de sistema
printf "Buscando se há novas atualizações para o sistema...\n"
sudo apt update && apt list --upgradable && sudo apt upgrade

printf "Fim do script.\n"
