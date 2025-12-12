#!/usr/bin/env bash
set -euo pipefail

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo -e "${GREEN}=== Firefox Privacy Profiles Installer ===${NC}"
echo ""

# Проверка зависимостей
deps=(firefox curl git)
for d in "${deps[@]}"; do
    command -v "$d" >/dev/null 2>&1 || error "Не найдено: $d"
done
success "Все зависимости установлены"

FIREFOX_DIR="$HOME/.mozilla/firefox"

# Создание профилей
create_profile() {
    local name="$1"
    if grep -q "$name" "$FIREFOX_DIR/profiles.ini" 2>/dev/null; then
        warn "Профиль '$name' уже существует"
    else
        info "Создаю профиль '$name'"
        firefox -CreateProfile "$name" >/dev/null 2>&1 || error "Не удалось создать профиль"
        success "Профиль '$name' создан"
    fi
}

create_profile "Banki"
create_profile "Personal"

# Получение путей к профилям
profile_path() {
    local name="$1"
    grep -A1 "$name" "$FIREFOX_DIR/profiles.ini" \
        | grep Path \
        | cut -d= -f2
}

BANKI_DIR="$FIREFOX_DIR/$(profile_path Banki)"
PERSONAL_DIR="$FIREFOX_DIR/$(profile_path Personal)"

echo ""
info "Пути профилей:"
echo -e "  Banki → ${GREEN}$BANKI_DIR${NC}"
echo -e "  Personal → ${GREEN}$PERSONAL_DIR${NC}"

# Установка Betterfox в Banki
install_betterfox() {
    info "Устанавливаю Betterfox в профиль Banki"

    tmp=$(mktemp -d)
    git clone --depth=1 https://github.com/yokoffing/Betterfox.git "$tmp"

    cp "$tmp/user.js" "$BANKI_DIR/user.js"

    rm -rf "$tmp"
    success "Betterfox установлен"
}

# Установка arkenfox в Personal
install_arkenfox() {
    info "Устанавливаю arkenfox в профиль Personal"

    tmp=$(mktemp -d)
    git clone --depth=1 https://github.com/arkenfox/user.js.git "$tmp"

    cp "$tmp/user.js" "$PERSONAL_DIR/user.js"
    cp "$tmp/prefsCleaner.sh" "$PERSONAL_DIR/"
    cp "$tmp/updater.sh" "$PERSONAL_DIR/"

    (
        cd "$PERSONAL_DIR"
        chmod +x updater.sh prefsCleaner.sh
        ./updater.sh >/dev/null 2>&1 || true
    )

    rm -rf "$tmp"
    success "arkenfox успешно установлен"
}

echo ""
install_betterfox
install_arkenfox

echo ""
success "Установка всех компонентов завершена!"
echo ""

echo -e "${YELLOW}Запуск профилей:${NC}"
echo -e "  Banki:    ${GREEN}firefox -P Banki -no-remote &${NC}"
echo -e "  Personal: ${GREEN}firefox -P Personal -no-remote &${NC}"

echo ""
echo -e "${GREEN}=== Готово! Наслаждайся приватностью. ===${NC}"
