#!/bin/bash

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# Logowanie do pliku (opcjonalne)
# exec > >(tee -a ~/czyszczenie_log.txt) 2>&1

echo -e "${YELLOW}🧹 Czyszczenie ~/.cache...${RESET}"
rm -rf ~/.cache/*

echo -e "${YELLOW}🗑️  Czyszczenie kosza...${RESET}"
rm -rf ~/.local/share/Trash/files/*

echo -e "${YELLOW}🖼️  Czyszczenie miniatur...${RESET}"
rm -rf ~/.cache/thumbnails/*

echo -e "${YELLOW}📦 Czyszczenie starych Snapów...${RESET}"
snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
done

if command -v flatpak &> /dev/null; then
    echo -e "${YELLOW}📦 Czyszczenie nieużywanych Flatpaków...${RESET}"
    flatpak uninstall --unused -y
fi

echo -e "${YELLOW}🧰 Czyszczenie APT...${RESET}"
sudo apt autoremove --purge -y
sudo apt autoclean

echo -e "${YELLOW}🗄️  Czyszczenie starych logów (journalctl)...${RESET}"
sudo journalctl --vacuum-time=7d

echo -e "${GREEN}✅ Czyszczenie zakończone!${RESET}"

