# 🧹 czyszczenie-ubuntu

Prosty i skuteczny skrypt bashowy do czyszczenia systemu Ubuntu.

## Funkcje

- Czyszczenie katalogu cache
- Czyszczenie kosza i miniaturek
- Usuwanie starych Snapów
- Usuwanie nieużywanych Flatpaków
- `apt autoremove` + `apt autoclean`
- Czyszczenie starych logów z `journalctl`

## Wymagania

- Ubuntu (lub inna dystrybucja oparta na APT)
- `snap` (jeśli używasz Snapów)
- `flatpak` (jeśli masz Flatpaki)

## Użycie

```bash
chmod +x czyszczenie.sh
sudo ./czyszczenie.sh
