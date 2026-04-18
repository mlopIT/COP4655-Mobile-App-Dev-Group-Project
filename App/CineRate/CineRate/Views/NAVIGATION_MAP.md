# CineRate App Navigation Map

## 📱 App Structure

```
┌─────────────────────────────────────────────────────────────┐
│                     MainTabContainer                         │
│                  (Root View - Use This!)                     │
│                                                              │
│  ┌────────────┬────────────┬────────────┬────────────┐      │
│  │   HOME     │  SEARCH    │  ACTIVITY  │  PROFILE   │      │
│  │   Tab 1    │   Tab 2    │   Tab 3    │   Tab 4    │      │
│  └────────────┴────────────┴────────────┴────────────┘      │
│                                                              │
│              CustomNavigationBar (Bottom)                    │
└─────────────────────────────────────────────────────────────┘
```

## 🏠 Tab 1: Home Screen

```
┌──────────────────────────┐
│     HomeScreen           │
│                          │
│  📺 Hero Section         │
│     (Trending Movie)     │
│                          │
│  ⭐ Trending TV Shows    │
│     (Horizontal Scroll)  │
│                          │
│  🎬 Explore Genres       │
│                          │
│  [Tap Any Media]         │
│         ↓                │
│  MediaDetailScreen       │
│  (No Bottom Nav)         │
└──────────────────────────┘
```

**Features:**
- ✅ Loads trending content
- ✅ Hero image with gradient
- ✅ Horizontal scrolling cards
- ✅ Navigation to detail view

## 🔍 Tab 2: Search Screen

```
┌──────────────────────────┐
│    SearchScreen          │
│                          │
│  🔍 Search Bar           │
│  [Type to search...]     │
│                          │
│  [ALL] [MOVIES] [TV]     │
│  (Filter Pills)          │
│                          │
│  ┌─────────────────┐     │
│  │ 📽️ The Matrix   │     │
│  │ Movie • 1999    │     │
│  │ ⭐ 8.7          │     │
│  └─────────────────┘     │
│  [More results...]       │
│         ↓                │
│  MediaDetailScreen       │
└──────────────────────────┘
```

**States:**
- ✅ Empty (no search yet)
- ✅ Searching (loading)
- ✅ Results (cards)
- ✅ No results (helpful message)

**Needs:**
- ⚠️ MediaService.searchMedia() method

## 🔔 Tab 3: Activity Screen

### When NOT Logged In:
```
┌──────────────────────────┐
│   ActivityScreen         │
│                          │
│       🔔                 │
│                          │
│  Sign In to View         │
│  Activity                │
│                          │
│  Track your ratings,     │
│  reviews, and watchlist  │
│                          │
│  [SIGN IN]               │
│  [CREATE ACCOUNT]        │
└──────────────────────────┘
```

### When Logged In:
```
┌──────────────────────────┐
│   ActivityScreen         │
│                          │
│  [ALL][REVIEWS][RATINGS] │
│  [WATCHLIST]             │
│                          │
│  ┌─────────────────┐     │
│  │ ⭐ You rated    │     │
│  │ The Matrix      │     │
│  │ 2 hours ago     │     │
│  └─────────────────┘     │
│  ┌─────────────────┐     │
│  │ 📝 You reviewed │     │
│  │ Inception       │     │
│  │ Yesterday       │     │
│  └─────────────────┘     │
└──────────────────────────┘
```

**Features:**
- ✅ Auth gate (requires login)
- ✅ Filter by activity type
- ✅ Timeline display
- ✅ Empty states

**Needs:**
- ⚠️ Load activities from Supabase

## 👤 Tab 4: Profile Screen

### When NOT Logged In:
```
┌──────────────────────────┐
│    ProfileScreen         │
│                          │
│        👤                │
│                          │
│  Create Your Profile     │
│                          │
│  Sign in to track your   │
│  ratings, reviews, and   │
│  watchlist               │
│                          │
│  [SIGN IN]               │
│  [CREATE ACCOUNT]        │
└──────────────────────────┘
```

### When Logged In:
```
┌──────────────────────────┐
│    ProfileScreen         │
│                          │
│       JD                 │
│    (Avatar)              │
│   John Doe               │
│  john@example.com        │
│                          │
│  147      32      89     │
│ Ratings Reviews Watchlist│
│                          │
│ [RATINGS][REVIEWS][LIST] │
│                          │
│ ┌──┬──┬──┐               │
│ │🎬│🎬│🎬│  (Media Grid) │
│ ├──┼──┼──┤               │
│ │🎬│🎬│🎬│               │
│ └──┴──┴──┘               │
│                          │
│ SETTINGS                 │
│ ⚙️ Edit Profile          │
│ 🔔 Notifications         │
│ 🔒 Privacy & Security    │
│ 🚪 Sign Out              │
└──────────────────────────┘
```

**Features:**
- ✅ Auth gate (requires login)
- ✅ User stats display
- ✅ Tab for content types
- ✅ Settings menu
- ✅ Sign out with confirmation

**Needs:**
- ⚠️ Load user data from Supabase

## 🔐 Authentication Screens

### Sign In (Modal/Navigation)
```
┌──────────────────────────┐
│    SignInScreen          │
│                          │
│  WELCOME BACK            │
│  Continue Your           │
│  Cinematic Journey       │
│                          │
│  EMAIL                   │
│  [input field]           │
│                          │
│  PASSWORD                │
│  [input field]           │
│                          │
│  ☑ Remember me           │
│  Forgot Password? →      │
│                          │
│  [SIGN IN]               │
│                          │
│  ────── OR ──────        │
│                          │
│  [🌐 CONTINUE WITH       │
│      GOOGLE]             │
│                          │
│  Don't have an account?  │
│  Sign Up →               │
└──────────────────────────┘
```

**Backend:**
- ✅ Supabase email/password auth
- ⚠️ Google OAuth (needs setup)

### Create Account (Modal/Navigation)
```
┌──────────────────────────┐
│  CreateAccountScreen     │
│                          │
│  SIGN UP NOW             │
│  Your one-way ticket to  │
│  the Greatest Stories    │
│  Ever Told.              │
│                          │
│  NAME                    │
│  [input field]           │
│                          │
│  EMAIL                   │
│  [input field]           │
│                          │
│  PASSWORD                │
│  [input field]           │
│                          │
│  CINEMATIC TASTE         │
│  [AVANT-GARDE]           │
│  [SMART-INDIE]           │
│                          │
│  [CREATE ACCOUNT]        │
│                          │
│  ────── OR ──────        │
│                          │
│  [🌐 CONTINUE WITH       │
│      GOOGLE]             │
└──────────────────────────┘
```

**Backend:**
- ✅ Supabase account creation
- ⚠️ Google OAuth (needs setup)

## 📺 Media Detail Screen

```
┌──────────────────────────┐
│  MediaDetailScreen       │
│                          │
│  ← [Back]      [Menu]    │
│                          │
│  ┌────────────────────┐  │
│  │                    │  │
│  │  Backdrop Image    │  │
│  │                    │  │
│  └────────────────────┘  │
│                          │
│  THE MATRIX              │
│  ⭐ 8.7 • 1999 • MOVIE   │
│  Action • Sci-Fi         │
│                          │
│  [⭐ RATE & REVIEW] 🔖   │
│                          │
│  SYNOPSIS                │
│  A computer hacker...    │
│                          │
│  CAST                    │
│  [Horizontal scroll]     │
│                          │
│  ADDITIONAL INFO         │
│  Release Date: ...       │
│  Runtime: ...            │
└──────────────────────────┘
```

**Features:**
- ✅ Full media details
- ✅ Cast carousel
- ✅ Watchlist toggle
- ✅ Rating/review button
- ⚠️ No bottom nav (intentional)

## 📋 Hamburger Menu (Sidebar)

### When NOT Logged In:
```
┌──────────────────────────┐
│     Sidebar              │
│                    [X]   │
│       🎬                 │
│                          │
│  Welcome to CineRate     │
│                          │
│  [Sign In]               │
│  [Create Account]        │
│                          │
│  BROWSE                  │
│  🏠 Home                 │
│  🔥 Trending             │
│  ⭐ Top Rated            │
│  🎬 Movies               │
│  📺 TV Shows             │
│  🏷️ Browse Genres        │
│  🔍 Search               │
│                          │
│  INFO                    │
│  ❓ Help & Support       │
│  ℹ️ About CineRate       │
│  📄 Terms & Privacy      │
└──────────────────────────┘
```

### When Logged In:
```
┌──────────────────────────┐
│     Sidebar              │
│                    [X]   │
│      JD                  │
│    John Doe              │
│   @johndoe               │
│                          │
│  147   32    89          │
│ Ratings Reviews Watchlist│
│                          │
│  DISCOVER                │
│  🏠 Home                 │
│  🔥 Trending             │
│  ⭐ Top Rated            │
│  🎬 Movies               │
│  📺 TV Shows             │
│  🏷️ Genres               │
│                          │
│  MY LIBRARY              │
│  ⭐ My Ratings     147   │
│  🔖 Watchlist      89    │
│  ❤️ Favorites      42    │
│  🕐 Watch History        │
│  📝 My Reviews     32    │
│                          │
│  SOCIAL                  │
│  👥 Following            │
│  🔔 Activity      3      │
│  💬 Discussions          │
│                          │
│  MORE                    │
│  ⚙️ Settings             │
│  ❓ Help & Support       │
│  ℹ️ About                │
│                          │
│  🚪 Sign Out             │
└──────────────────────────┘
```

## 🔄 Authentication Flow Diagram

```
           App Launch
                │
                ↓
        MainTabContainer
                │
                ↓
         AuthService Check
           /         \
          /           \
    NOT AUTH         AUTH
         │             │
         ↓             ↓
    Limited      Full Access
    Features      Features
         │             │
         ↓             ↓
    Activity → Prompt  Activity → Feed
    Profile → Prompt   Profile → Stats
         │                    │
         ↓                    ↓
    [Sign In]            [Use App]
    [Sign Up]                 │
         │                    ↓
         ↓              [Sign Out] ←┐
    Supabase Auth              │    │
    (Success)                  │    │
         │                     └────┘
         ↓
    AUTH State
    Updated
```

## 📦 File Organization

```
CineRate/
├── App Entry
│   └── CineRateApp.swift → Use MainTabContainer
│
├── Navigation (BottomNavBar.swift)
│   ├── AppTab enum
│   ├── MainTabContainer ← ROOT VIEW
│   └── CustomNavigationBar
│
├── Screens/
│   ├── HomeScreen.swift ✅
│   ├── SearchScreen.swift ✅ NEW
│   ├── ActivityScreen.swift ✅ NEW
│   ├── ProfileScreen.swift ✅ NEW
│   ├── MediaDetailScreen.swift ✅
│   ├── SignInScreen.swift ✅
│   └── CreateAccountScreen.swift ✅
│
├── Components/
│   └── SidebarComponents.swift ✅
│
└── Services/
    ├── AuthService.swift ✅ (Supabase)
    ├── SupabaseConfig.swift ✅
    └── MediaService.swift ⚠️ (needs searchMedia)
```

## ✅ Implementation Checklist

### ✅ DONE (Already Working)
- [x] Bottom tab navigation (4 tabs)
- [x] Home screen with trending content
- [x] Search screen UI
- [x] Activity screen UI
- [x] Profile screen UI
- [x] Sign in page
- [x] Create account page
- [x] Supabase authentication
- [x] Auth state management
- [x] Sidebar menu (2 states)
- [x] Media detail screen
- [x] Empty states
- [x] Loading states
- [x] Auth gates (prompts)

### ⚠️ TODO (Backend Integration)
- [ ] Implement MediaService.searchMedia()
- [ ] Load user activities from Supabase
- [ ] Load user ratings from Supabase
- [ ] Load user reviews from Supabase
- [ ] Load user watchlist from Supabase
- [ ] Connect watchlist toggle to backend
- [ ] Implement Google OAuth (optional)
- [ ] Implement password reset (optional)

## 🎯 Quick Start

1. **Set your app's root view:**
```swift
@main
struct CineRateApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabContainer()  // ← Start here!
        }
    }
}
```

2. **Test the tabs:**
- Home: Should load trending content
- Search: UI ready, needs search implementation
- Activity: Shows sign-in prompt if not logged in
- Profile: Shows sign-in prompt if not logged in

3. **Test authentication:**
- Go to Profile tab
- Tap "CREATE ACCOUNT"
- Enter email & password
- Account created in Supabase!

That's it! Your app is fully navigable with authentication! 🎉
