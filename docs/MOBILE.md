# Mobile Setup Guide (Android)

Firefox on Android doesn't support multiple profiles like the desktop version. This guide shows alternative approaches for privacy separation on mobile.

## Current Limitations

❌ **Not available on Android:**
- Multiple Firefox profiles
- Multi-Account Containers
- user.js configuration files

✅ **Available alternatives:**
- Multiple browser apps for separation
- Private browsing mode
- Privacy-focused Firefox forks

## Recommended Setup

### Multi-Browser Approach (Best)

Use different browsers for different purposes:

**Browser 1: Brave** → Daily browsing
- Built-in ad blocking
- Fast and private by default
- Good for general web surfing

**Browser 2: Firefox** → Banking & Payments
- Standard Firefox (most compatible)
- Google Pay integration
- Sync with desktop banking profile (optional)

**Browser 3: Mull Browser** → Personal Accounts
- Firefox fork with Arkenfox-like settings
- Maximum privacy by default
- Available on F-Droid

**Browser 4: Firefox Focus** → Disposable Browsing
- Automatic history deletion
- One-tap clearing
- Perfect for quick searches

### Installation
```bash
# Via F-Droid (recommended)
1. Install F-Droid from f-droid.org
2. Search and install:
   - Mull Browser
   - Firefox Focus

# Via Google Play
1. Install from Play Store:
   - Brave Browser
   - Firefox Browser
   - Firefox Focus
```

## Advanced: Work Profile Isolation

For maximum separation, use Android's work profile feature.

### Using Island or Shelter

**Island** (Google Play) or **Shelter** (F-Droid) creates a separate work profile:

1. Install Island or Shelter
2. Set up work profile
3. Clone Firefox into work profile
4. Result: Two completely isolated Firefox instances
   - Personal profile → Firefox for banking
   - Work profile → Firefox for personal accounts

**Pros:**
- Complete OS-level isolation
- True multi-profile experience
- Data can't leak between profiles

**Cons:**
- More complex to switch between
- Slight performance overhead
- Requires Android 5.0+

### Setup Steps

1. **Install Island or Shelter**
