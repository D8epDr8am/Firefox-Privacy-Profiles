/******
 * PERSONAL PROFILE - Custom Overrides
 * 
 * This file contains settings for maximum privacy protection.
 * Based on Arkenfox recommendations with practical adjustments.
 * 
 * Customize this file according to your needs.
 ******/

// === CORE PRIVACY ===

// Enable Resist Fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Disable letterboxing (removes white borders)
// Set to true if you want maximum fingerprint protection
user_pref("privacy.resistFingerprinting.letterboxing", false);

// Canvas randomization
user_pref("privacy.resistFingerprinting.randomDataOnCanvasExtract", true);

// === FUNCTIONALITY ===

// Enable WebGL (needed for maps, some web apps)
// Set to true to disable for maximum privacy
user_pref("webgl.disabled", false);

// Enable DRM for streaming (Netflix, Spotify, etc.)
// Set to false if you don't use DRM content
user_pref("media.eme.enabled", true);

// === NETWORKING ===

// Disable WebRTC (prevents IP leaks)
user_pref("media.peerconnection.enabled", false);

// DNS over HTTPS
user_pref("network.trr.mode", 2);

// === EXTENSIONS ===

// Allow extensions to work on restricted domains
user_pref("extensions.webextensions.restrictedDomains", "");

// Enable extension auto-updates
user_pref("extensions.update.enabled", true);
user_pref("extensions.update.autoUpdateDefault", true);

// === LANGUAGE ===

// Don't spoof language to English
// Set to 2 to always appear as English user
user_pref("privacy.spoof_english", 0);

// === TRACKING PROTECTION ===

// Enhanced Tracking Protection (Strict)
user_pref("browser.contentblocking.category", "strict");

// Enable Firefox tracking protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

// === TELEMETRY ===

// Disable all Firefox telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);

// === SAFE BROWSING ===

// Keep safe browsing enabled (recommended)
// Set to false only if you know what you're doing
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.phishing.enabled", true);

// === OPTIONAL FEATURES ===

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Disable Firefox View
user_pref("browser.tabs.firefox-view", false);

// Disable Firefox Screenshots
user_pref("extensions.screenshots.disabled", true);

// === YOUR CUSTOM SETTINGS ===
// Add your own preferences below
