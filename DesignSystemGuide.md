# Using Your Design System in Swift (SwiftUI)

This guide walks you through every part of the design system step-by-step. Each section explains **what it is**, **why it exists**, and **how to use it** with examples.

---

## Table of Contents

1. [Setup — Adding Files to Xcode](#1-setup--adding-files-to-xcode)
2. [Typography — Fonts](#2-typography--fonts)
3. [Colors](#3-colors)
4. [Spacing](#4-spacing)
5. [Corner Radius](#5-corner-radius)
6. [Buttons](#6-buttons)
7. [Cards](#7-cards)
8. [Glass Effect](#8-glass-effect)
9. [Theme System (Advanced)](#9-theme-system-advanced)
10. [Bottom Navigation Bar](#10-bottom-navigation-bar)
11. [Top Navigation Bar — Notch Safe Area](#11-top-navigation-bar--notch-safe-area)
12. [Quick Reference Cheat Sheet](#12-quick-reference-cheat-sheet)

---

## 1. Setup — Adding Files to Xcode

Before you can use any of the design system, you need to add all the files from the zip into your Xcode project.

### Steps:
1. Unzip `DesignSystem.zip`
2. In Xcode, right-click your project folder in the **Project Navigator** (left sidebar)
3. Choose **"Add Files to [Your Project Name]..."**
4. Select the entire `DesignSystem` folder
5. Make sure **"Copy items if needed"** is checked ✅
6. Click **Add**

> ⚠️ **Important — Add the Inter Font:**
> Your design system uses the **Inter** font. You need to install it manually:
> 1. Download Inter from [fonts.google.com/specimen/Inter](https://fonts.google.com/specimen/Inter)
> 2. Drag the `.ttf` files into your Xcode project (make sure "Copy items if needed" is checked)
> 3. In your `Info.plist`, add a key called **"Fonts provided by application"** and list each font file name (e.g., `Inter-Regular.ttf`, `Inter-Bold.ttf`)

---

## 2. Typography — Fonts

### What it is
`AppFonts` is a collection of pre-defined font sizes using the Inter typeface. Instead of writing `Font.custom("Inter", size: 16)` every time, you just write `AppFonts.body`.

### Available Fonts

| Name | Size | Use it for |
|---|---|---|
| `AppFonts.displayLarge` | 40pt | Hero titles, splash screens |
| `AppFonts.displayMedium` | 32pt | Section headers |
| `AppFonts.headlineLarge` | 24pt | Screen titles |
| `AppFonts.title` | 20pt | Card titles, navigation |
| `AppFonts.body` | 16pt | Regular paragraph text |
| `AppFonts.bodySmall` | 14pt | Secondary descriptions |
| `AppFonts.label` | 12pt | Tags, captions, timestamps |

### How to use — Option A: `.font()` modifier
Apply a font directly to any `Text` view:

```swift
Text("Welcome Back")
    .font(AppFonts.headlineLarge)

Text("Here's what's new today.")
    .font(AppFonts.body)

Text("POSTED 2 DAYS AGO")
    .font(AppFonts.label)
```

### How to use — Option B: Typography Modifiers (Recommended ✅)
Your design system includes pre-built shortcuts called **typography modifiers**. These apply the font *and* the correct color automatically:

```swift
Text("Welcome Back")
    .headline()         // Inter 24pt + white color

Text("Here's what's new.")
    .bodyText()         // Inter 16pt + gray color

Text("POSTED 2 DAYS AGO")
    .label()            // Inter 12pt + uppercase + letter spacing

Text("Big Hero Title")
    .displayLarge()     // Inter 40pt + white color + tight tracking
```

> 💡 **Tip:** Use the modifier shortcuts (`.headline()`, `.bodyText()`, etc.) whenever you can — they automatically handle color too, so your text always looks consistent.

---

## 3. Colors

### What it is
`AppColors` is your palette. All colors are dark-mode themed and named by their *purpose*, not their appearance. This means if you ever update a color, it changes everywhere automatically.

### Available Colors

| Name | Hex | Use it for |
|---|---|---|
| `AppColors.surface` | `#131315` | Main background of screens |
| `AppColors.surfaceContainer` | `#1f1f21` | Cards, sheets, bottom bars |
| `AppColors.surfaceContainerHigh` | `#2a2a2c` | Elevated cards, modals |
| `AppColors.surfaceContainerHighest` | `#353437` | Highest elevation elements |
| `AppColors.primary` | `#abc7ff` | Accent text, active icons, links |
| `AppColors.primaryContainer` | `#0071e3` | Button backgrounds, highlights |
| `AppColors.outlineVariant` | `#414753` | Borders, dividers, separators |
| `AppColors.onSurface` | White | Primary text on dark backgrounds |
| `AppColors.onSurfaceVariant` | Gray | Secondary/subdued text |

### How to use

```swift
// Set background color of a view
Rectangle()
    .fill(AppColors.surface)

// Color for text
Text("Hello")
    .foregroundColor(AppColors.onSurface)

Text("Subtitle")
    .foregroundColor(AppColors.onSurfaceVariant)

// Accent / primary color
Text("View All")
    .foregroundColor(AppColors.primary)

// Border / divider
Divider()
    .overlay(AppColors.outlineVariant)
```

### Screen Background Example

```swift
struct HomeScreen: View {
    var body: some View {
        ZStack {
            AppColors.surface
                .ignoresSafeArea() // fills the whole screen including top/bottom
            
            VStack {
                Text("Home")
                    .headline()
            }
        }
    }
}
```

---

## 4. Spacing

### What it is
`AppSpacing` gives you consistent spacing values to use for padding and gaps. This keeps your layout looking uniform without guessing numbers.

### Available Spacing

| Name | Value | Use it for |
|---|---|---|
| `AppSpacing.sm` | 8pt | Tight gaps, icon-to-label spacing |
| `AppSpacing.md` | 16pt | Standard padding inside cards |
| `AppSpacing.lg` | 24pt | Section padding, generous card padding |
| `AppSpacing.xl` | 32pt | Large sections, between major groups |
| `AppSpacing.xxl` | 64pt | Hero sections, splash whitespace |

### How to use

```swift
// Add padding around a view
Text("Hello")
    .padding(AppSpacing.md)        // 16pt on all sides

Text("Hello")
    .padding(.horizontal, AppSpacing.lg)  // 24pt left & right only

// Gap between items in a stack
VStack(spacing: AppSpacing.sm) {
    Text("Item 1")
    Text("Item 2")
    Text("Item 3")
}

// Padding inside a card
VStack(alignment: .leading, spacing: AppSpacing.sm) {
    Text("Card Title").headline()
    Text("Description text here.").bodyText()
}
.padding(AppSpacing.lg)
```

---

## 5. Corner Radius

### What it is
`AppRadius` gives you consistent rounded corners for cards, buttons, and other containers.

### Available Radii

| Name | Value | Use it for |
|---|---|---|
| `AppRadius.md` | 24pt | Smaller cards, chips |
| `AppRadius.lg` | 32pt | Large cards, modals, sheets |
| `AppRadius.full` | 999pt | Pill-shaped buttons, tags (fully rounded) |

### How to use

```swift
// Rounded card background
RoundedRectangle(cornerRadius: AppRadius.lg)
    .fill(AppColors.surfaceContainer)

// Pill-shaped tag
Text("New")
    .padding(.horizontal, AppSpacing.md)
    .padding(.vertical, AppSpacing.sm)
    .background(AppColors.primaryContainer)
    .cornerRadius(AppRadius.full)

// Clipping an image into rounded corners
Image("photo")
    .resizable()
    .aspectRatio(contentMode: .fill)
    .frame(width: 200, height: 120)
    .cornerRadius(AppRadius.md)
```

---

## 6. Buttons

### What it is
Your design system includes two ready-to-use button styles. Apply them with `.buttonStyle(...)`.

### PrimaryButtonStyle
A gradient button (blue to light blue), pill-shaped, with a subtle press animation.

```swift
Button("Get Started") {
    // your action here
}
.buttonStyle(PrimaryButtonStyle())
```

### GlassButtonStyle
A frosted glass button — semi-transparent with a subtle border.

```swift
Button("Learn More") {
    // your action here
}
.buttonStyle(GlassButtonStyle())
```

### Full Example — Two Buttons Side by Side

```swift
HStack(spacing: AppSpacing.md) {
    Button("Sign Up") {
        print("Sign up tapped")
    }
    .buttonStyle(PrimaryButtonStyle())
    
    Button("Log In") {
        print("Log in tapped")
    }
    .buttonStyle(GlassButtonStyle())
}
.padding(AppSpacing.lg)
```

> 💡 **Tip:** Both button styles scale down slightly when tapped (`scaleEffect: 0.97`), giving a satisfying press feel automatically — no extra code needed.

---

## 7. Cards

### What it is
A `.solidCardStyle()` modifier wraps any view in a card container: dark background, rounded corners, and standard padding.

### How to use

```swift
VStack(alignment: .leading, spacing: AppSpacing.sm) {
    Text("Today's Summary")
        .headline()
    Text("You completed 3 tasks and hit your goal.")
        .bodyText()
}
.solidCardStyle()
```

This automatically applies:
- `padding(AppSpacing.lg)` — 24pt padding inside
- `background(AppColors.surfaceContainer)` — dark card background
- `cornerRadius(AppRadius.lg)` — 32pt rounded corners

### Card in a List

```swift
ScrollView {
    VStack(spacing: AppSpacing.md) {
        ForEach(items) { item in
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text(item.title).headline()
                Text(item.description).bodyText()
            }
            .solidCardStyle()
        }
    }
    .padding(AppSpacing.lg)
}
.background(AppColors.surface.ignoresSafeArea())
```

---

## 8. Glass Effect

### What it is
The glass effect gives views a frosted-glass look — blurred background with a subtle border overlay. Great for overlays, floating cards, and bottom sheets.

### Simple Glass Card — `.glassCardStyle()`

```swift
VStack {
    Text("Now Playing")
        .headline()
    Text("Lo-fi Beats Radio")
        .bodyText()
}
.glassCardStyle()
```

This applies 16pt padding, a dark semi-transparent background, and rounded corners.

### Full Glass Effect — `.glass()`
For more dramatic frosted glass (blurs whatever is behind the view):

```swift
VStack {
    Text("Overlay Content")
        .headline()
}
.padding(AppSpacing.lg)
.glass()
.cornerRadius(AppRadius.lg)
```

> ⚠️ **Note:** The `.glass()` modifier uses `@Environment(\.theme)`. Make sure you've injected the theme into your app (see Section 9 below). If not using the theme system, use `.glassCardStyle()` instead — it works without it.

---

## 9. Theme System (Advanced)

### What it is
The theme system lets you inject a single `DarkTheme` object into your entire app, making all colors, spacing, fonts, and radius values available anywhere via `@Environment(\.theme)`. This is the most scalable approach and enables easy light/dark theme switching later.

### Step 1 — Inject the theme at the app root

In your `@main` app file (usually `YourAppNameApp.swift`):

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.theme, DarkTheme())  // ← add this line
        }
    }
}
```

### Step 2 — Read the theme in any view

```swift
struct ProfileCard: View {
    @Environment(\.theme) var theme   // ← add this at the top of your view

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            Text("Alex Johnson")
                .font(theme.typography.headlineLarge)
                .foregroundColor(theme.colors.onSurface)
            
            Text("iOS Developer")
                .font(theme.typography.body)
                .foregroundColor(theme.colors.onSurfaceVariant)
        }
        .padding(theme.spacing.lg)
        .background(theme.colors.surfaceContainer)
        .cornerRadius(theme.radius.lg)
    }
}
```

### Theme vs. AppColors/AppFonts — Which should I use?

| Situation | Recommendation |
|---|---|
| Simple, single-screen app | Use `AppColors`, `AppFonts`, etc. directly — simpler |
| Multi-screen app or you want easy theming later | Inject the theme and use `@Environment(\.theme)` |
| Using `.glass()` modifier | **Must** inject the theme (it requires it) |

---

## 10. Bottom Navigation Bar

### What it is
`CustomNavigationBar` is a reusable bottom tab bar with four tabs: **Home, Search, Activity, and Profile**. The active tab lights up in `AppColors.primary` (blue), and inactive tabs show in `AppColors.onSurfaceVariant` (gray). It uses `AppRadius.lg` to round only its **top-left and top-right corners**, giving it a floating panel look that sits flush at the bottom of the screen.

The file lives at `DesignSystem/Components/BottomNavBar.swift`.

---

### ⚠️ Why you need a ZStack — The Home Indicator Problem

On every modern iPhone, Apple reserves a strip at the very bottom of the screen for the **Home Indicator** (the little swipe bar). If you place a view normally in a `VStack`, SwiftUI will automatically add padding above that reserved area — meaning your nav bar floats awkwardly above the bottom edge instead of sitting flush against it.

**The fix:** Wrap your entire screen in a `ZStack` and use `.ignoresSafeArea(.container, edges: .bottom)` on the nav bar. This tells SwiftUI: *"let this view bleed into the Home Indicator zone"* — and the nav bar snaps perfectly to the bottom edge. The content behind it stays safely above, so nothing gets hidden.

```
Without ZStack fix:          With ZStack fix:
┌──────────────┐             ┌──────────────┐
│              │             │              │
│   Content    │             │   Content    │
│              │             │              │
├──────────────┤             ├──────────────┤
│   Nav Bar    │             │   Nav Bar    │
├──────────────┤             └──────────────┘  ← flush to edge ✅
│  dead space  │
└──────────────┘
```

---

### How to use — Basic Drop-In

Just place `CustomNavigationBar()` anywhere and it works as a standalone preview:

```swift
CustomNavigationBar()
```

---

### How to use — Full Screen Layout (Recommended ✅)

This is the correct pattern for a real screen. The `ZStack` layers the nav bar on top of your content, and `.ignoresSafeArea` makes it hug the bottom edge properly:

```swift
struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {  // ← layers children; .bottom aligns them to the bottom edge

            // ── Layer 1: Screen background (fills everything including safe areas)
            AppColors.surface
                .ignoresSafeArea()

            // ── Layer 2: Your scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: AppSpacing.lg) {
                    Text("Trending Now 🎬")
                        .displayLarge()

                    Text("Top picks for you today.")
                        .bodyText()

                    // ...your cards, content, etc.
                }
                .padding(AppSpacing.lg)
                .padding(.bottom, 100) // ← push content up so it isn't hidden behind the nav bar
            }

            // ── Layer 3: Nav bar overlaid on top, pinned to the bottom
            CustomNavigationBar()
                .ignoresSafeArea(.container, edges: .bottom) // ← this is the key line
        }
    }
}
```

> 💡 **Why `.padding(.bottom, 100)` on the ScrollView?**
> The nav bar overlays the content — it doesn't push it up. Without bottom padding on your scroll content, the last card would scroll behind the nav bar and be unreachable. Adding ~100pt of padding at the bottom of your scroll area creates a safe buffer so all content is accessible.

---

### How the tab switching works

The nav bar manages its own selected state internally using `@State`:

```swift
@State private var selectedTab = "HOME"
```

When a tab is tapped, `selectedTab` updates, and the `foregroundColor` on each tab switches between `AppColors.primary` (active) and `AppColors.onSurfaceVariant` (inactive) automatically. You don't need to do anything extra — it handles itself.

---

### Customizing the tabs

The tabs are defined as a simple list of `(icon, name)` pairs at the top of the component:

```swift
let tabs = [
    ("house",          "HOME"),
    ("magnifyingglass","SEARCH"),
    ("bell",           "ACTIVITY"),
    ("person",         "PROFILE")
]
```

To change a tab, just swap the SF Symbol name or the label string. For example, to replace **Activity** with a **Favorites** tab:

```swift
("heart", "FAVORITES")
```

All SF Symbol names can be browsed in Apple's free **SF Symbols** app, available at [developer.apple.com/sf-symbols](https://developer.apple.com/sf-symbols).

---

## 11. Top Navigation Bar — Notch Safe Area

### What it is

`TopNavigationBar.swift` is a solid dark header used at the top of the screen. On iPhones with a notch or Dynamic Island, the background should extend into the status bar area while the bar's text and icon content remains safely inside the visible safe area.

### Why this matters

SwiftUI keeps view content inside the safe area by default. That is good for buttons and text, but when the background is full black, the header should also bleed behind the camera/notch so the top edge looks seamless.

### How to use it

Wrap the screen in a `ZStack`, place the header at the top, and let the background extend into the top safe area while keeping the header's content padded normally.

```swift
struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            AppColors.surface
                .ignoresSafeArea(edges: .top)

            VStack(spacing: 0) {
                TopNavigationBar()
                Spacer()
            }
        }
    }
}
```

### TopNavigationBar example

```swift
import SwiftUI

struct TopNavigationBar: View {
    var body: some View {
        HStack {
            Text("CINERATE")
                .font(AppFonts.displayMedium)
                .tracking(2)
                .foregroundColor(AppColors.onSurface)

            Spacer()

            Button(action: {
                print("Menu tapped")
            }) {
                VStack(spacing: 5) {
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.md)
        .background(AppColors.surface)
    }
}
```

### Important note

Do not apply `.ignoresSafeArea(edges: .top)` to `TopNavigationBar` itself; apply it only to the screen background. This keeps the header looking full-bleed while preserving safe spacing for the text and menu icon.

---

## 12. Quick Reference Cheat Sheet

### Fonts
```swift
.font(AppFonts.displayLarge)    // 40pt
.font(AppFonts.headlineLarge)   // 24pt
.font(AppFonts.body)            // 16pt
.font(AppFonts.label)           // 12pt

// Or use modifiers (font + color in one):
.displayLarge()
.headline()
.bodyText()
.label()
```

### Colors
```swift
AppColors.surface                  // screen background
AppColors.surfaceContainer         // card background
AppColors.primary                  // accent / link color
AppColors.primaryContainer         // button background
AppColors.onSurface                // main text (white)
AppColors.onSurfaceVariant         // secondary text (gray)
AppColors.outlineVariant           // borders / dividers
```

### Spacing
```swift
AppSpacing.sm   // 8pt
AppSpacing.md   // 16pt
AppSpacing.lg   // 24pt
AppSpacing.xl   // 32pt
AppSpacing.xxl  // 64pt
```

### Corner Radius
```swift
AppRadius.md    // 24pt — small cards
AppRadius.lg    // 32pt — large cards
AppRadius.full  // 999pt — pill shapes
```

### Components
```swift
.buttonStyle(PrimaryButtonStyle())   // gradient pill button
.buttonStyle(GlassButtonStyle())     // frosted glass button
.solidCardStyle()                    // dark card with padding
.glassCardStyle()                    // glass card with padding
.glass()                             // full glass effect (needs theme)
CustomNavigationBar()                // bottom tab bar (Home/Search/Activity/Profile)
```

---

## Complete Screen Example

Here's a full screen using your design system from top to bottom:

```swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Full-screen background
            AppColors.surface
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: AppSpacing.lg) {

                    // Header
                    Text("Good Morning 👋")
                        .displayLarge()

                    Text("Here's your daily overview.")
                        .bodyText()

                    // Summary Card
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        Text("Today's Goal")
                            .headline()
                        Text("Complete 5 tasks to hit your weekly target.")
                            .bodyText()

                        Button("View Tasks") {}
                            .buttonStyle(PrimaryButtonStyle())
                    }
                    .solidCardStyle()

                    // Glass Card
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        Text("Streak")
                            .headline()
                        Text("7 days in a row 🔥")
                            .bodyText()
                    }
                    .padding(AppSpacing.lg)
                    .glassCardStyle()

                    // Secondary button
                    Button("View Full Report") {}
                        .buttonStyle(GlassButtonStyle())
                }
                .padding(AppSpacing.lg)
            }
        }
    }
}
```

---

*This guide covers your design system as found in `DesignSystem.zip` and `BottomNavBar.swift`. If you add new tokens or components, update this file to match.*
