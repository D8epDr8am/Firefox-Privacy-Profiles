#!/bin/bash

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Firefox Profiles Setup ===${NC}"

# Путь к профилям
FIREFOX_DIR="$HOME/.mozilla/firefox"

# Создаём профили если их нет
echo -e "${YELLOW}Создание профилей...${NC}"
firefox -CreateProfile "Banki" 2>/dev/null
firefox -CreateProfile "Personal" 2>/dev/null

# Находим папки профилей
BANKI_PROFILE=$(grep "Path.*Banki" "$FIREFOX_DIR/profiles.ini" | cut -d= -f2)
PERSONAL_PROFILE=$(grep "Path.*Personal" "$FIREFOX_DIR/profiles.ini" | cut -d= -f2)

if [ -z "$BANKI_PROFILE" ] || [ -z "$PERSONAL_PROFILE" ]; then
    echo -e "${RED}Ошибка: профили не найдены${NC}"
    exit 1
fi

BANKI_DIR="$FIREFOX_DIR/$BANKI_PROFILE"
PERSONAL_DIR="$FIREFOX_DIR/$PERSONAL_PROFILE"

echo -e "${GREEN}Banki профиль: $BANKI_DIR${NC}"
echo -e "${GREEN}Personal профиль: $PERSONAL_DIR${NC}"

# === НАСТРОЙКА BANKI (BetterFox) ===
echo -e "${YELLOW}Настройка профиля Banki (BetterFox)...${NC}"

cd /tmp
rm -rf BetterFox
git clone --depth=1 https://github.com/yokoffing/BetterFox.git

cp BetterFox/user.js "$BANKI_DIR/"
cp BetterFox/Securefox.js "$BANKI_DIR/"
cp BetterFox/Fastfox.js "$BANKI_DIR/"
cp BetterFox/Peskyfox.js "$BANKI_DIR/"
cp BetterFox/Smoothfox.js "$BANKI_DIR/"

# Создаём user-overrides.js для Banki
cat > "$BANKI_DIR/user-overrides.js" << 'EOF'
/******
* ПРОФИЛЬ: БАНКИ
* Цель: стабильность, скорость, совместимость
******/

// Отключаем агрессивную приватность
user_pref("privacy.resistFingerprinting", false);

// DRM для банковских приложений
user_pref("media.eme.enabled", true);

// WebRTC для видеозвонков
user_pref("media.peerconnection.enabled", true);

// Автозаполнение форм
user_pref("signon.autofillForms", true);

// Уведомления
user_pref("permissions.default.desktop-notification", 0);

// WebGL
user_pref("webgl.disabled", false);
EOF

echo -e "${GREEN}✓ BetterFox установлен в Banki${NC}"

# === НАСТРОЙКА PERSONAL (Arkenfox) ===
echo -e "${YELLOW}Настройка профиля Personal (Arkenfox)...${NC}"

cd /tmp
rm -rf arkenfox-user.js
git clone --depth=1 https://github.com/arkenfox/user.js.git arkenfox-user.js

cp arkenfox-user.js/user.js "$PERSONAL_DIR/"
cp arkenfox-user.js/updater.sh "$PERSONAL_DIR/"
cp arkenfox-user.js/prefsCleaner.sh "$PERSONAL_DIR/"

chmod +x "$PERSONAL_DIR/updater.sh"
chmod +x "$PERSONAL_DIR/prefsCleaner.sh"

# Создаём user-overrides.js для Personal
cat > "$PERSONAL_DIR/user-overrides.js" << 'EOF'
/******
* ПРОФИЛЬ: ЛИЧНЫЕ АККАУНТЫ
* Цель: максимальная приватность
******/

// RFP включён
user_pref("privacy.resistFingerprinting", true);

// Letterboxing выключен
user_pref("privacy.resistFingerprinting.letterboxing", false);

// WebGL для карт
user_pref("webgl.disabled", false);

// Расширения
user_pref("extensions.webextensions.restrictedDomains", "");

// WebRTC выключен
user_pref("media.peerconnection.enabled", false);

// DRM для стриминга
user_pref("media.eme.enabled", true);

// Не спуфить язык
user_pref("privacy.spoof_english", 0);

// Автообновление расширений
user_pref("extensions.update.enabled", true);
user_pref("extensions.update.autoUpdateDefault", true);

// Canvas blocker - умеренный уровень
user_pref("privacy.resistFingerprinting.randomDataOnCanvasExtract", true);
EOF

# Применяем настройки Arkenfox
cd "$PERSONAL_DIR"
./updater.sh

echo -e "${GREEN}✓ Arkenfox установлен в Personal${NC}"

# Очистка
cd /tmp
rm -rf BetterFox arkenfox-user.js

echo -e "${GREEN}=== Установка завершена ===${NC}"
echo -e "${YELLOW}Профили готовы к использованию!${NC}"
echo ""
echo -e "Запуск профилей:"
echo -e "  Banki:    ${GREEN}firefox -P Banki -no-remote &${NC}"
echo -e "  Personal: ${GREEN}firefox -P Personal -no-remote &${NC}"
