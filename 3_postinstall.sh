sudo dpkg --add-architecture i386

# Instalar estas bibliotecas 32 bits para maximizar compatibilidade com programas e jogos 32 bits?
sudo apt install lib32gcc-s1 lib32stdc++6

# Selecione quais destes pacotes essenciais você deseja instalar:
sudo apt install btop cpu-x feh inkscape inxi kcolorchooser kdenlive kdf kget krita neofetch paprefs p7zip-rar qbittorrent ristretto telegram-desktop mpv

# Selecione quais destes pacotes relacionados a games você deseja instalar:
sudo apt install steam mangohud

# Instalar o wine?
sudo apt install wine

# Instalar fontes Microsoft?
sudo apt install ttf-mscorefonts-installer

# Instalar Flatpak e adicionar o repositório Flathub?
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instalar o gerenciador de Flatpaks?
flatpak install flathub io.github.flattool.Warehouse
# Instalar o Flatpak Discord?
flatpak install flathub com.discordapp.Discord
# Instalar o Flatpak Flatseal?
flatpak install flathub com.github.tchx84.Flatseal
# Instalar o Flatpak Protontricks?
flatpak install flathub com.github.Matoking.protontricks
flatpak override --user --filesystem=/mnt/games/SteamLibrary com.github.Matoking.protontricks

# Por fim, buscando novas atualizações de sistema.
sudo apt update && apt list --upgradable && sudo apt upgrade

#Fim do script.
