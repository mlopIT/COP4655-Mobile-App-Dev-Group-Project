# Navigation Architecture Diagram

## Component Hierarchy

```
CineRateApp.swift
└── MainTabContainer
    ├── @StateObject authService: AuthService
    ├── @StateObject navigationCoordinator: NavigationCoordinator
    └── NavigationStack(path: $navigationCoordinator.path)
        ├── ZStack
        │   ├── Tab Content (based on selectedTab)
        │   │   ├── HomeScreen
        │   │   ├── SearchScreen
        │   │   ├── ActivityScreen
        │   │   └── ProfileScreen
        │   └── CustomNavigationBar (bottom tabs)
        └── .navigationDestination(for: NavigationDestination.self)
            └── Dynamic screens based on navigation
                ├── SettingsScreen
                ├── HelpSupportScreen
                ├── PlaceholderScreen (for Trending, etc.)
                └── Other screens...
```

## Data Flow: Authentication State

```
AuthService (Source of Truth)
    ├── isAuthenticated: Bool
    └── currentUser: User?
         │
         ├─── (Environment Object) ──→ MainTabContainer
         ├─── (Environment Object) ──→ HomeScreen
         ├─── (Environment Object) ──→ Sidebar
         │                              └── Shows LoggedInSidebarContent or LoggedOutSidebarContent
         ├─── (Environment Object) ──→ SettingsScreen
         └─── (Environment Object) ──→ HelpSupportScreen
```

## Data Flow: Navigation

```
User Taps Menu Item in Sidebar
         ↓
navigationCoordinator.navigate(to: .settings)
         ↓
path.append(.settings)
         ↓
NavigationStack detects path change
         ↓
.navigationDestination triggers
         ↓
navigationDestination(for: .settings) called
         ↓
Returns SettingsScreen view
         ↓
SettingsScreen pushed onto stack
         ↓
Sidebar automatically closes
```

## Sidebar State Management

```
BEFORE (Broken):
HomeScreen
    └── @State showSidebar = false
    └── Sidebar(isShowing: $showSidebar, isLoggedIn: true)  ← Hardcoded!

SettingsScreen
    └── @State showSidebar = false  ← Duplicate state!
    └── Sidebar(isShowing: $showSidebar, isLoggedIn: true)

AFTER (Fixed):
NavigationCoordinator (Single Source)
    └── @Published showSidebar = false
         │
         ├─── HomeScreen
         │    └── Sidebar(isShowing: $navigationCoordinator.showSidebar)
         │        └── Reads authService.isAuthenticated dynamically
         │
         └─── SettingsScreen
              └── Sidebar(isShowing: $navigationCoordinator.showSidebar)
                  └── Reads authService.isAuthenticated dynamically
```

## Menu Item Action Flow

```
BEFORE (Broken):
User taps "Settings" in Sidebar
    ↓
action: { print("Settings tapped") }  ← Does nothing!
    ↓
Message printed to console
    ↓
Nothing happens in UI

AFTER (Fixed):
User taps "Settings" in Sidebar
    ↓
action: { navigationCoordinator.navigate(to: .settings) }
    ↓
Navigation path updated
    ↓
Settings screen pushed onto stack
    ↓
Sidebar automatically closes
    ↓
User sees Settings screen
```

## Sign Out Flow

```
User taps "Sign Out" in Sidebar
    ↓
Task {
    try await authService.signOut()
    navigationCoordinator.popToRoot()
    isShowing = false
}
    ↓
Supabase Auth: Sign out user
    ↓
authService.isAuthenticated = false
authService.currentUser = nil
    ↓
All @Published properties update
    ↓
Views observing authService re-render
    ↓
Navigation stack pops to root
    ↓
Sidebar closes
    ↓
Home screen shows with logged-out state
    ↓
Next time sidebar opens → shows LoggedOutSidebarContent
```

## Environment Object Injection

```
MainTabContainer
    └── NavigationStack(path: ...)
        └── HomeScreen
            .environmentObject(authService)
            .environmentObject(navigationCoordinator)
        └── .navigationDestination { destination in
                navigationDestination(for: destination)
                    .environmentObject(authService)
                    .environmentObject(navigationCoordinator)
            }

This ensures ALL screens in the navigation stack have access to:
- AuthService (to check login state)
- NavigationCoordinator (to navigate)
```

## Navigation Destinations Enum

```swift
enum NavigationDestination: Hashable {
    // Browse
    case home, trending, topRated, movies, tvShows, genres
    
    // Library (Authenticated Only)
    case myRatings, watchlist, favorites, watchHistory, myReviews
    
    // Social (Authenticated Only)
    case following, activity, discussions
    
    // Settings & Info
    case settings, helpSupport, about
    
    // Auth
    case signIn, createAccount, termsPrivacy
    
    // Search
    case search
    
    // Detail Views
    case mediaDetail(mediaId: Int, mediaType: String)
}
```

## Sidebar Menu Logic

```
Sidebar.body
    ├── if isShowing
    │   └── if authService.isAuthenticated
    │       ├── LoggedInSidebarContent
    │       │   ├── Profile Header
    │       │   ├── Discover Menu (6 items)
    │       │   ├── Library Menu (5 items)
    │       │   ├── Social Menu (3 items)
    │       │   ├── More Menu (3 items)
    │       │   └── Sign Out Button
    │       └── else
    │           └── LoggedOutSidebarContent
    │               ├── Welcome Header
    │               ├── Sign In Button
    │               ├── Create Account Button
    │               ├── Browse Menu (7 items)
    │               ├── Info Menu (3 items)
    │               └── Version Footer
```

## Complete User Journey

```
1. App Launch
   └── CineRateApp creates MainTabContainer
       └── MainTabContainer creates AuthService & NavigationCoordinator
           └── AuthService checks session
               └── If no session: isAuthenticated = false

2. User Opens Sidebar (Not Logged In)
   └── Sidebar reads authService.isAuthenticated (false)
       └── Shows LoggedOutSidebarContent
           └── Limited menu items
           └── Sign In / Create Account buttons visible

3. User Taps "Sign In"
   └── navigationCoordinator.navigate(to: .signIn)
       └── Sign In screen pushed
           └── User enters credentials
               └── authService.signIn(email, password)
                   └── isAuthenticated = true
                       └── All views observing authService update

4. User Opens Sidebar (Now Logged In)
   └── Sidebar reads authService.isAuthenticated (true)
       └── Shows LoggedInSidebarContent
           └── Full menu with all features
           └── Profile info displayed
           └── Sign Out button at bottom

5. User Taps "Settings"
   └── navigationCoordinator.navigate(to: .settings)
       └── Settings screen pushed onto stack
           └── Sidebar automatically closes
               └── User sees Settings screen

6. User Navigates Back
   └── Taps back button or swipes
       └── NavigationStack pops Settings
           └── Returns to Home screen

7. User Opens Sidebar Again
   └── Can navigate to any other screen
   └── Each navigation closes sidebar automatically

8. User Signs Out
   └── authService.signOut()
       └── isAuthenticated = false
           └── navigationCoordinator.popToRoot()
               └── Returns to Home
                   └── Sidebar closes
                       └── Next sidebar open shows logged-out menu
```

## Key Improvements

### ✅ Single Source of Truth
- Authentication: AuthService
- Navigation: NavigationCoordinator
- No duplicate state across screens

### ✅ Type Safety
- NavigationDestination enum prevents typos
- Compile-time checking
- Autocomplete in Xcode

### ✅ Automatic Updates
- When auth state changes, sidebar updates automatically
- No manual state synchronization needed

### ✅ Clean Separation of Concerns
- AuthService: Manages authentication
- NavigationCoordinator: Manages navigation
- Sidebar: Just displays menu based on auth state
- Screens: Just display content

### ✅ Scalability
- Easy to add new destinations
- Easy to add new menu items
- Easy to implement new screens

## Future Architecture Enhancements

```
Current:
NavigationCoordinator
    └── path: NavigationPath
    └── showSidebar: Bool

Possible Additions:
NavigationCoordinator
    ├── path: NavigationPath
    ├── showSidebar: Bool
    ├── navigationHistory: [NavigationDestination]  ← Track history
    ├── canGoBack: Bool  ← Computed property
    ├── canGoForward: Bool  ← For redo functionality
    └── tabHistory: [AppTab: NavigationPath]  ← Remember state per tab
```
