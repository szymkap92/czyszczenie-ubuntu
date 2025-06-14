#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${YELLOW}🧹 Czyszczenie ~/.cache...${RESET}"
rm -rf ~/.cache/*

echo -e "${YELLOW}🗑️   Czyszczenie kosza...${RESET}"
rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/*

echo -e "${YELLOW}🖼️   Czyszczenie miniatur...${RESET}"
rm -rf ~/.cache/thumbnails/*

echo -e "${YELLOW}🗄️   Czyszczenie plików recent...${RESET}"
rm -f ~/.local/share/recently-used.xbel

echo -e "${YELLOW}🗄️   Czyszczenie osieroconych .desktop...${RESET}"
find ~/.local/share/applications/ -name "*.desktop" -exec grep -L "Exec=" {} \; -delete

echo -e "${YELLOW}🔐 Czyszczenie blokad APT...${RESET}"
sudo rm -f /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock

echo -e "${YELLOW}📦 Czyszczenie starych Snapów...${RESET}"
snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
done

echo -e "${YELLOW}📦 Czyszczenie Snap cache...${RESET}"
sudo rm -rf /var/lib/snapd/cache/*

if command -v flatpak &> /dev/null; then
    echo -e "${YELLOW}📦 Czyszczenie nieużywanych Flatpaków...${RESET}"
    flatpak uninstall --unused -y
fi

echo -e "${YELLOW}🧰 Czyszczenie APT...${RESET}"
sudo apt autoremove --purge -y
sudo apt autoclean -y
sudo apt clean -y

echo -e "${YELLOW}🗄️   Czyszczenie starych logów (journalctl)...${RESET}"
sudo journalctl --vacuum-time=7d

echo -e "${GREEN}✅ Czyszczenie zakończone PRO!${RESET}"

