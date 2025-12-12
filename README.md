<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" role="img" aria-labelledby="t">
  <title id="t">FPP icon</title>

  <rect width="64" height="64" rx="8" fill="none"/>

  <!-- Shield -->
  <path d="M32 6 L54 18 L54 38 C54 50 42 60 32 62 C22 60 10 50 10 38 L10 18 Z"
        fill="#0f1724"/>

  <!-- Wolf face (minimal) -->
  <polygon points="24,30 32,20 40,30 48,26 40,38 32,34 24,38 16,26"
           fill="#9ae6b4"/>
  <circle cx="28" cy="30" r="1.6" fill="#0f1724"/>
  <circle cx="36" cy="30" r="1.6" fill="#0f1724"/>
</svg>
<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="140" viewBox="0 0 600 140" role="img" aria-labelledby="titleDesc">
  <title id="titleDesc">Firefox Privacy Profiles — logo</title>
  <desc>Shield with wolf head + project name</desc>

  <!-- Background transparent -->
  <g transform="translate(18,12)">
    <!-- Shield -->
    <path d="M46 4 L94 24 L94 76 C94 102 70 124 46 132 C22 124 -2 102 -2 76 L-2 24 Z"
          fill="#0f1724" stroke="#ffffff" stroke-width="2" opacity="0.98"/>

    <!-- Wolf (stylized, geometric) -->
    <g transform="translate(12,12) scale(0.9)">
      <polygon points="38,28 50,14 62,28 74,22 62,44 50,36 38,44 26,22"
               fill="#9ae6b4"/>
      <polygon points="50,36 62,44 74,22" fill="#2d3748" opacity="0.08"/>
      <circle cx="46" cy="30" r="2" fill="#0f1724"/>
      <circle cx="58" cy="30" r="2" fill="#0f1724"/>
    </g>
  </g>

  <!-- Text -->
  <g transform="translate(140,48)">
    <text x="0" y="0" font-family="Inter, Roboto, Arial, sans-serif" font-size="30" fill="#0f1724" font-weight="700">
      Firefox Privacy
    </text>
    <text x="0" y="36" font-family="Inter, Roboto, Arial, sans-serif" font-size="16" fill="#374151" font-weight="500">
      Profiles · isolated · secure
    </text>
  </g>
</svg>


# Firefox-Privacy-Profiles

firefox
privacy
arkenfox
betterfox
security
https://github.com/arkenfox/user.js/



https://github.com/yokoffing/BetterFox
# Firefox Privacy Profiles

Автоматизированный установщик двух полностью изолированных приватных профилей Firefox.  
Проект предназначен для пользователей, которые хотят разделить повседневную деятельность и онлайн-банкинг, усилив безопасность и приватность браузинга.

Скрипт создаёт два профиля:

- **Banki** — безопасный профиль для онлайн-банкинга. Минимум телеметрии, максимум изоляции.
- **Personal** — личный профиль с продвинутой конфигурацией приватности на базе arkenfox.

Проект не изменяет системные файлы Firefox и не затрагивает существующие профили.

---

## Возможности

- Создаёт два независимых профиля Firefox.
- Устанавливает современную конфигурацию Betterfox (Banki).
- Автоматически применяет arkenfox (Personal).
- Обновляет пользовательские настройки через `updater.sh`.
- Использует временные директории, не оставляя мусора.
- Понятный цветной вывод и проверка зависимостей.

---

## Требования

- Linux (Arch/Manjaro/Ubuntu/PopOS — без разницы)
- Установленный Firefox
- Наличие `curl` и `git`

---

## Установка

Сделайте скрипт исполняемым:

```bash
chmod +x setup-firefox-privacy.sh

Запустите установщик:




./setup-firefox-privacy.sh



В процессе будут автоматически созданы и настроены профили Banki и Personal.



Использование


Запуск банковского профиля:




firefox -P Banki -no-remote &



Запуск личного профиля:




firefox -P Personal -no-remote &



Оба профиля живут в ~/.mozilla/firefox.
