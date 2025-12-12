# Troubleshooting Guide

Common issues and their solutions.

## Installation Issues

### "Profiles not found" error

**Problem:** Script can't find created profiles in `profiles.ini`

**Solution:**
1. Close all Firefox windows
2. Run: `firefox -ProfileManager`
3. Create profiles manually
4. Run script again

### Git clone fails

**Problem:** Cannot clone BetterFox or Arkenfox repositories

**Solution:**
```bash
# Check internet connection
ping github.com

# Try manual download
cd /tmp
wget https://github.com/yokoffing/BetterFox/archive/refs/heads/main.zip
unzip main.zip
```

## Profile Issues

### Wrong profile launches

**Problem:** Firefox opens default profile instead of specified one

**Solution:**
```bash
# Use -no-remote flag
firefox -P "Banki" -no-remote

# Or close all Firefox instances first
killall firefox
firefox -P "Banki"
```

### Profiles not appearing in ProfileManager

**Problem:** Created profiles don't show up

**Solution:**
```bash
# Check profiles.ini
cat ~/.mozilla/firefox/profiles.ini

# Recreate profiles
firefox -CreateProfile "Banki"
firefox -CreateProfile "Personal"
```

## Configuration Issues

### Banking sites not working

**Problem:** Login fails or site doesn't load properly

**Solutions:**

1. **Check RFP setting:**
```javascript
   // In about:config, verify:
   privacy.resistFingerprinting = false  // Should be false for Banking
```

2. **Enable cookies:**
   - Settings → Privacy & Security
   - Cookies and Site Data → Manage Exceptions
   - Add your bank's domain

3. **Disable tracking protection temporarily:**
   - Click shield icon in address bar
   - Toggle protection off for this site

### Videos not playing

**Problem:** Can't watch Netflix, YouTube, etc. in Personal profile

**Solution:**
```javascript
// Add to user-overrides.js:
user_pref("media.eme.enabled", true);

// Then run:
cd ~/.mozilla/firefox/*.Personal/
./updater.sh
```

### Maps not loading

**Problem:** Google Maps, OpenStreetMap show blank

**Solution:**
```javascript
// Add to user-overrides.js:
user_pref("webgl.disabled", false);

// Restart Firefox
```

### Constant CAPTCHA challenges

**Problem:** Too many CAPTCHA challenges in Personal profile

**Solutions:**

1. **Relax RFP letterboxing:**
```javascript
   user_pref("privacy.resistFingerprinting.letterboxing", false);
```

2. **Use less aggressive fingerprint protection:**
```javascript
   user_pref("privacy.resistFingerprinting", false);
   // Note: This reduces privacy significantly
```

3. **Use different search engine:**
   - DuckDuckGo has fewer CAPTCHAs than Google

## Extension Issues

### KeePassXC not connecting

**Problem:** Browser extension can't connect to KeePassXC

**Solution:**
1. Check KeePassXC is running
2. Enable browser integration:
   - KeePassXC → Settings → Browser Integration
   - Enable Firefox integration
3. In Firefox:
   - about:config
   - Verify: `extensions.webextensions.restrictedDomains` is empty

### uBlock Origin blocks too much

**Problem:** Sites break due to aggressive blocking

**Solutions:**

1. **Whitelist specific site:**
   - Click uBlock icon
   - Click power button to disable on site

2. **Adjust filter lists:**
   - uBlock settings → Filter lists
   - Disable problematic lists

3. **Use medium mode:**
   - uBlock settings → Settings
   - Set to "Optimal" instead of "Hard mode"

### Multi-Account Containers not syncing

**Problem:** Containers don't sync between devices

**Solution:**
Containers are profile-specific and don't sync. This is by design for privacy.

## Performance Issues

### Firefox slow to start

**Problem:** Long startup time for profiles

**Solutions:**

1. **Reduce startup extensions:**
   - Disable unnecessary extensions
   - Keep only essential ones

2. **Clear cache:**
```bash
   cd ~/.mozilla/firefox/*.Personal/
   rm -rf cache2/
```

3. **Disable prefetching (BetterFox):**
```javascript
   user_pref("network.predictor.enabled", false);
   user_pref("network.dns.disablePrefetch", true);
```

### High memory usage

**Problem:** Firefox uses too much RAM

**Solutions:**

1. **Reduce content processes:**
   - about:config
   - `dom.ipc.processCount` = 4 (or lower)

2. **Enable tab unloading:**
```javascript
   user_pref("browser.tabs.unloadOnLowMemory", true);
```

3. **Use fewer tabs/extensions**

## Update Issues

### update.sh fails

**Problem:** Update script throws errors

**Solution:**
```bash
# Manual update for Arkenfox
cd ~/.mozilla/firefox/*.Personal/
git -C /tmp clone --depth=1 https://github.com/arkenfox/user.js.git
cp /tmp/user.js/user.js ./
./updater.sh

# Manual update for BetterFox
cd ~/.mozilla/firefox/*.Banki/
git -C /tmp clone --depth=1 https://github.com/yokoffing/BetterFox.git
cp /tmp/BetterFox/*.js ./
```

### Settings reset after update

**Problem:** Custom settings lost after update

**Cause:** user-overrides.js was overwritten

**Prevention:**
Always backup before updating:
```bash
cp ~/.mozilla/firefox/*.Personal/user-overrides.js ~/user-overrides.backup
```

## Wayland Issues

### Blurry text on Wayland

**Problem:** Firefox text looks blurry under Wayland

**Solution:**
```bash
# Add to launch command or alias:
MOZ_ENABLE_WAYLAND=1 firefox -P "Banki"

# Or set globally in /etc/environment:
MOZ_ENABLE_WAYLAND=1
```

### Screen sharing not working

**Problem:** Can't share screen in video calls

**Solution:**
```bash
# Install xdg-desktop-portal-gtk
sudo pacman -S xdg-desktop-portal-gtk  # Arch
sudo apt install xdg-desktop-portal-gtk  # Ubuntu
```

## Getting Help

If your issue isn't listed here:

1. **Check Firefox console:**
   - Press F12 → Console tab
   - Look for errors

2. **Check about:support:**
   - Lists detailed Firefox configuration
   - Useful for troubleshooting

3. **Open an issue:**
   - [GitHub Issues](https://github.com/yourusername/firefox-privacy-profiles/issues)
   - Include:
     - OS and Firefox version
     - Profile type (Banking/Personal)
     - Error messages
     - Steps to reproduce

4. **Upstream documentation:**
   - [Arkenfox Wiki](https://github.com/arkenfox/user.js/wiki)
   - [BetterFox README](https://github.com/yokoffing/BetterFox)
