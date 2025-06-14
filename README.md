# 🧹 czyszczenie-ubuntu PRO-SAFE

Zaawansowany i bezpieczny skrypt Bash do regularnego czyszczenia systemu Ubuntu oraz porządkowania zbędnych plików.

---

## 🔧 Funkcje

- Czyszczenie katalogu cache (`~/.cache`)
- Opróżnianie kosza (`~/.local/share/Trash`)
- Usuwanie miniaturek (`~/.cache/thumbnails`)
- Automatyczne usuwanie starych wersji snapów
- Czyszczenie nieużywanych flatpaków (jeżeli flatpak jest zainstalowany)
- Czyszczenie zbędnych pakietów APT (`autoremove`, `autoclean`)
- Oczyszczanie logów systemowych (`journalctl`) starszych niż 7 dni
- Kolorowe komunikaty dla lepszej czytelności
- Wersja bezpieczna: nie usuwa niczego co mogłoby wpłynąć na systemowe GUI

---

## 🖥️ Wymagania

- Ubuntu 20.04 / 22.04 / 24.04 (LTS zalecane)
- Pakiety: `snap`, `flatpak` (opcjonalnie jeśli używasz)
- Uprawnienia `sudo` do czyszczenia logów i systemu

---

## 🔎 Sposób użycia

1️⃣ Pobierz skrypt:
```bash
git clone https://github.com/szymkap92/czyszczenie-ubuntu.git
cd czyszczenie-ubuntu
