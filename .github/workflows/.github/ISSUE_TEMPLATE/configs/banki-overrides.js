/******
 * BANKING PROFILE - Custom Overrides
 * 
 * This file contains settings optimized for banking and payment systems.
 * These settings prioritize compatibility over privacy.
 * 
 * Customize this file according to your needs.
 ******/

// === COMPATIBILITY ===

// Disable aggressive fingerprinting protection
// (Banking sites often break with this enabled)
user_pref("privacy.resistFingerprinting", false);

// Enable DRM for banking video verification
user_pref("media.eme.enabled", true);

// Enable WebRTC for video calls with bank support
user_pref("media.peerconnection.enabled", true);

// === CONVENIENCE ===

// Enable form autofill
user_pref("signon.autofillForms", true);

// Allow credit card autofill (optional, disable if you prefer manual entry)
user_pref("extensions.formautofill.creditCards.enabled", true);

// === FUNCTIONALITY ===

// Enable WebGL (needed for some banking sites)
user_pref("webgl.disabled", false);

// Allow notifications (for payment confirmations)
user_pref("permissions.default.desktop-notification", 0);

// Enable geolocation (some banks require this for fraud prevention)
user_pref("permissions.default.geo", 0);

// === OPTIONAL: Disable if not needed ===

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Disable Firefox View
user_pref("browser.tabs.firefox-view", false);

// === YOUR CUSTOM SETTINGS ===
// Add your own preferences below
