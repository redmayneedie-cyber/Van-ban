#!/bin/bash

CONFIG_DIR="$HOME/.config/neon-banner"
STARTUP_FILE="$CONFIG_DIR/startup.sh"
SETTINGS_FILE="$CONFIG_DIR/settings"
BASHRC="$HOME/.bashrc"

mkdir -p "$CONFIG_DIR"

# Couleurs disponibles
COLORS=("rainbow" "red" "green" "cyan" "magenta" "yellow" "blue" "white")

clear
echo "⛧ NEON-BANNER : CRÉATEUR ⛧"
echo "----------------------------------------"
echo "Nom du dépôt : Neon-Banner"
echo "Auteur : 𝐕𝟒𝐍𝐓𝐄𝐒𝐒"
echo "Label : REQUIEM AURA"
echo "----------------------------------------"

read -p "Nom d'utilisateur [𝐕𝟒𝐍𝐓𝐄𝐒𝐒] : " USER_NAME
USER_NAME=${USER_NAME:-𝐕𝟒𝐍𝐓𝐄𝐒𝐒}

read -p "Tagline [REQUIEM AURA] : " TAGLINE
TAGLINE=${TAGLINE:-REQUIEM AURA}

read -p "Artwork (dragon, tux, vader, sheep, moose, chacal) [dragon] : " ARTWORK
ARTWORK=${ARTWORK:-dragon}

echo "Couleurs disponibles : ${COLORS[*]}"
read -p "Couleur (rainbow, red, green, cyan, magenta, yellow, blue, white) [rainbow] : " COLOR
COLOR=${COLOR:-rainbow}

# Génération du fichier de démarrage
cat > "$STARTUP_FILE" << EOF
#!/bin/bash
clear

# Dragon / Chacal / etc.
if [ "$ARTWORK" = "chacal" ]; then
    echo "⛧ 𝐋𝐄 𝐂𝐇𝐀𝐂𝐀𝐋 ⛧" | lolcat
    echo "  /\_/\\"
    echo " ( o.o )"
    echo "  > ^ <"
else
    cowsay -f $ARTWORK "$TAGLINE"
fi

echo ""
if [ "$COLOR" = "rainbow" ]; then
    toilet -f big "$USER_NAME" -F gay | lolcat
else
    toilet -f big "$USER_NAME" -F metal --filter border
fi
echo ""
echo "----------------------------------------"
echo "Système : \$(uname -o) \$(uname -m)"
echo "Utilisateur : \$(whoami)"
echo "Date : \$(date)"
echo "----------------------------------------"
EOF

chmod +x "$STARTUP_FILE"

# Sauvegarde des réglages
echo "USER_NAME=$USER_NAME" > "$SETTINGS_FILE"
echo "TAGLINE=$TAGLINE" >> "$SETTINGS_FILE"
echo "ARTWORK=$ARTWORK" >> "$SETTINGS_FILE"
echo "COLOR=$COLOR" >> "$SETTINGS_FILE"

# Ajout au .bashrc
if ! grep -q "NEON_BANNER_START" "$BASHRC"; then
    echo "" >> "$BASHRC"
    echo "# NEON_BANNER_START" >> "$BASHRC"
    echo "source $STARTUP_FILE" >> "$BASHRC"
    echo "# NEON_BANNER_END" >> "$BASHRC"
fi

echo ""
echo "✅ Bannière installée ! Redémarre Termux."
