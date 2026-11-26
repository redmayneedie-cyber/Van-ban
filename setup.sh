#!/bin/bash
# Installation des dépendances pour VAN-Ban
echo "⛧ Initialisation de Neon-Banner ⛧"
pkg update -y && pkg install cowsay toilet ruby git -y
gem install lolcat
chmod +x vantess-banner.sh
bash vantess-banner.sh
