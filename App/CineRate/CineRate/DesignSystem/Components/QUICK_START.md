# 🚀 Quick Start Guide: Supabase + TMDB Setup

Get CINERATE's backend up and running in 15 minutes!

---

## 📋 Prerequisites

- macOS with Xcode installed
- Internet connection
- Git (optional, for version control)

---

## Part 1: Supabase Setup (5 minutes)

### Step 1: Create Supabase Project
1. Go to [supabase.com](https://supabase.com) → Sign up/Login
2. Click **"New Project"**
3. Fill in:
   - Name: `cinerate`
   - Password: Create strong password (save it!)
   - Region: Choose nearest
4. Click **"Create new project"** (wait ~2 min)

### Step 2: Run Database Setup
1. In Supabase dashboard, click **"SQL Editor"**
2. Click **"New Query"**
3. Open `SUPABASE_SETUP.md` in this project
4. Copy the entire SQL script (Step 2)
5. Paste into Supabase SQL Editor
6. Click **"Run"**
7. ✅ Verify: Check **"Table Editor"** - you should see `profiles`, `reviews`, `watchlist`

### Step 3: Get API Keys
1. Go to **Settings** → **API**
2. Copy:
   - **Project URL** (e.g., `https://xxxxx.supabase.co`)
   - **anon public** key (long token starting with `eyJ...`)

---

## Part 2: TMDB Setup (5 minutes)

### Step 4: Get TMDB API Key
1. Go to [themoviedb.org](https://www.themoviedb.org) → Sign up/Login
2. Click your avatar → **Settings**
3. Click **API** in left sidebar
4. Click **"Request an API Key"**
5. Choose **"Developer"**
6. Fill out form:
   - Type: Personal/Educational
   - Name: CINERATE
   - URL: (leave blank)
   - Summary: "iOS movie rating app"
7. Submit → **Copy your API Key** (looks like `a1b2c3d4e5f6...`)

---

## Part 3: Xcode Configuration (5 minutes)

### Step 5: Add Credentials to Secrets.xcconfig

Your `Secrets.xcconfig` file already exists. Update it with your actual keys:

```
// Supabase Configuration
SUPABASE_URL = https://xxxxx.supabase.co  ← Your Supabase URL
SUPABASE_ANON_KEY = eyJhbGc...             ← Your Supabase anon key

// TMDB API Configuration
TMDB_API_KEY = a1b2c3d4e5f6...             ← Your TMDB API key
```

**Example:**
```
SUPABASE_URL = https://udwfrwzkwbdxqpqlvqfd.supabase.co
SUPABASE_ANON_KEY = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSI...
TMDB_API_KEY = a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

### Step 6: Update Info.plist

1. Open `Info.plist` in Xcode
2. Add these three entries:

| Key | Type | Value |
|-----|------|-------|
| SUPABASE_URL | String | $(SUPABASE_URL) |
| SUPABASE_ANON_KEY | String | $(SUPABASE_ANON_KEY) |
| TMDB_API_KEY | String | $(TMDB_API_KEY) |

**Or paste this XML (Right-click Info.plist → Open As → Source Code):**

```xml
<key>SUPABASE_URL</key>
<string>$(SUPABASE_URL)</string>
<key>SUPABASE_ANON_KEY</key>
<string>$(SUPABASE_ANON_KEY)</string>
<key>TMDB_API_KEY</key>
<string>$(TMDB_API_KEY)</string>
```

### Step 7: Assign Configuration File

1. Click your **project** (blue icon) in navigator
2. Select the **project** (not target) in left panel
3. Go to **Info** tab
4. Under **Configurations**, expand **Debug** and **Release**
5. For your app target, select **"Secrets"** from dropdown for both

### Step 8: Install Supabase Package

1. In Xcode: **File** → **Add Package Dependencies...**
2. Enter URL: `https://github.com/supabase/supabase-swift`
3. Click **Add Package**
4. Select: **Supabase**, **Auth**, **PostgREST**
5. Click **Add Package**

### Step 9: Build & Test

1. Build project: **Cmd+B**
2. Run app: **Cmd+R**
3. Check Console - you should see:
   ```
   ✅ Supabase configured with URL: https://xxxxx.supabase.co
   ✅ TMDB API configured
   ```

---

## ✅ Verify Setup

### Quick Test Code

Add this to any SwiftUI view to test:

```swift
struct SetupTestView: View {
    @State private var status = "Testing..."
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Setup Test")
                .font(.title)
            
            Text(status)
                .multilineTextAlignment(.center)
            
            Button("Test APIs") {
                testSetup()
            }
        }
        .padding()
        .onAppear {
            testSetup()
        }
    }
    
    func testSetup() {
        Task {
            var results: [String] = []
            
            // Test Supabase
            do {
                let client = SupabaseConfig.shared.client
                _ = try await client.database
                    .from("profiles")
                    .select()
                    .limit(1)
                    .execute()
                results.append("✅ Supabase connected")
            } catch {
                results.append("❌ Supabase failed: \(error.localizedDescription)")
            }
            
            // Test TMDB
            do {
                let movies = try await TMDBService.shared.getTrendingMovies()
                results.append("✅ TMDB connected (\(movies.count) movies)")
            } catch {
                results.append("❌ TMDB failed: \(error.localizedDescription)")
            }
            
            status = results.joined(separator: "\n\n")
        }
    }
}
```

**Expected Output:**
```
✅ Supabase connected

✅ TMDB connected (20 movies)
```

---

## 🎉 You're Done!

Your backend is now fully configured! You can:

- ✅ Fetch movies and TV shows from TMDB
- ✅ Authenticate users with Supabase
- ✅ Store reviews and ratings
- ✅ Manage user watchlists
- ✅ Get community ratings

---

## 🚀 Next Steps

### Start Building Features

1. **Home Screen** - Display trending content
   ```swift
   let mediaService = MediaService()
   let movies = try await mediaService.getTrendingMovies()
   ```

2. **Search** - Search for movies/TV
   ```swift
   let results = try await mediaService.searchMovies(query: "Inception")
   ```

3. **Authentication** - Sign up/login
   ```swift
   let authService = AuthService()
   try await authService.signUp(email: email, password: password)
   ```

4. **Reviews** - Submit ratings
   ```swift
   try await mediaService.submitReview(
       mediaId: 550,
       mediaType: .movie,
       userId: userId,
       rating: 9.0,
       comment: "Great!"
   )
   ```

5. **Watchlist** - Save for later
   ```swift
   try await mediaService.toggleWatchlist(
       mediaId: 550,
       mediaType: .movie,
       userId: userId
   )
   ```

---

## 📚 Full Documentation

For detailed information, see:

- **`SUPABASE_SETUP.md`** - Complete Supabase guide
- **`TMDB_SETUP.md`** - Complete TMDB guide  
- **`DATABASE_SCHEMA.md`** - Database schema reference
- **`COMPLETE_INTEGRATION_CHECKLIST.md`** - Full testing checklist

---

## 🐛 Troubleshooting

### Build Errors

**"No such module 'Supabase'"**
- Install package (Step 8)
- Clean build: **Cmd+Shift+K**
- Restart Xcode

**"Configuration missing"**
- Check Step 5 (credentials added)
- Check Step 6 (Info.plist updated)
- Check Step 7 (configuration assigned)

### Runtime Errors

**"TMDB API key missing"**
- Verify `TMDB_API_KEY` in `Secrets.xcconfig`
- Verify Info.plist entry
- Clean and rebuild

**"Supabase configuration missing"**
- Verify `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `Secrets.xcconfig`
- Verify Info.plist entries
- Check configuration assignment

### API Errors

**401 Unauthorized (TMDB)**
- Check API key is correct
- No extra spaces in key
- Regenerate key if needed

**RLS Policy Violation (Supabase)**
- User must be authenticated
- Check policies in Supabase dashboard
- Verify SQL setup ran successfully

---

## 💡 Pro Tips

1. **Keep Secrets Safe**
   - `Secrets.xcconfig` is in `.gitignore`
   - Never commit API keys
   - Use template file for team

2. **Development vs Production**
   - Consider separate Supabase projects
   - Use different TMDB keys
   - Configure per environment

3. **Performance**
   - Cache TMDB responses
   - Batch Supabase queries
   - Use pagination for lists

4. **Testing**
   - Test with/without authentication
   - Test network failures
   - Test rate limits

---

## ✨ What You've Built

Your app now has:

- 🎬 Access to TMDB's entire catalog (millions of titles)
- 👥 User authentication system
- ⭐ Review and rating system
- 📋 Personal watchlist feature
- 🔒 Secure data storage with RLS
- 🌐 Real-time community ratings

**All with just a few configuration steps!**

---

## 🎯 Example: Complete Flow

Here's how everything works together:

```swift
// 1. User signs up
try await authService.signUp(email: "user@example.com", password: "pass123")

// 2. Browse trending movies (from TMDB)
let movies = try await mediaService.getTrendingMovies(userId: authService.currentUser?.id)

// 3. User taps movie → See details (TMDB + Supabase combined)
let movie = try await mediaService.getMovieDetails(id: 550, userId: authService.currentUser?.id)
// movie.averageRating ← Community rating from Supabase
// movie.userRating ← User's rating if they've reviewed
// movie.isInWatchlist ← Whether in their watchlist

// 4. User rates the movie (saves to Supabase)
try await mediaService.submitReview(
    mediaId: 550,
    mediaType: .movie,
    userId: authService.currentUser!.id,
    rating: 9.0,
    comment: "Masterpiece!"
)

// 5. User adds to watchlist (saves to Supabase)
try await mediaService.toggleWatchlist(
    mediaId: 550,
    mediaType: .movie,
    userId: authService.currentUser!.id
)

// 6. View watchlist (TMDB details + Supabase status)
let watchlist = try await mediaService.getUserWatchlist(
    userId: authService.currentUser!.id
)
```

---

**Happy Coding! 🎬✨**

**Need help?** Check the detailed guides or review the checklist!

---

**Last Updated:** April 16, 2026  
**Estimated Setup Time:** 15 minutes  
**Difficulty:** Easy  
**Status:** Production Ready
