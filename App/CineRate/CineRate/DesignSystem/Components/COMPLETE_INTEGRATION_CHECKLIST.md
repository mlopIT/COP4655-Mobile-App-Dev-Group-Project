# Complete Setup Checklist: Supabase + TMDB Integration

This comprehensive checklist covers setting up both Supabase (backend) and TMDB (content) APIs for CINERATE.

---

## 🗄️ Supabase Setup

### 1. Create Supabase Project
- [ ] Created account at [supabase.com](https://supabase.com)
- [ ] Created new project
- [ ] Saved database password securely
- [ ] Project fully initialized (green status indicator)

### 2. Database Configuration
- [ ] Opened SQL Editor in dashboard
- [ ] Executed complete schema SQL (from `SUPABASE_SETUP.md`)
- [ ] Verified tables created: `profiles`, `reviews`, `watchlist`
- [ ] Verified indexes created
- [ ] Verified RLS policies enabled (padlock icons visible)
- [ ] Tested `get_average_rating()` function works
- [ ] Verified trigger `on_auth_user_created` is active

### 3. Authentication Setup
- [ ] Email provider enabled
- [ ] Customized email templates (optional)
- [ ] Tested user signup flow in dashboard

### 4. API Credentials
- [ ] Copied Project URL from Settings → API
- [ ] Copied anon/public key from Settings → API
- [ ] Added to `Secrets.xcconfig`:
  ```
  SUPABASE_URL = https://xxxxx.supabase.co
  SUPABASE_ANON_KEY = eyJhbGc...
  ```

---

## 🎬 TMDB Setup

### 5. Create TMDB Account
- [ ] Created account at [themoviedb.org](https://www.themoviedb.org)
- [ ] Verified email address
- [ ] Completed profile

### 6. Request API Access
- [ ] Went to Settings → API
- [ ] Requested API key (Developer option)
- [ ] Accepted Terms of Use
- [ ] Filled out application form
- [ ] Received API key (v3)

### 7. TMDB Credentials
- [ ] Copied API Key from TMDB settings
- [ ] Added to `Secrets.xcconfig`:
  ```
  TMDB_API_KEY = a1b2c3d4e5f6...
  ```

---

## 📱 Xcode Configuration

### 8. Swift Packages
- [ ] Added Supabase package: `https://github.com/supabase/supabase-swift`
- [ ] Selected products: Supabase, Auth, PostgREST
- [ ] Package resolved successfully
- [ ] No package dependency errors

### 9. Configuration Files
- [ ] Created/Updated `Secrets.xcconfig` with all credentials
- [ ] Added `Secrets.xcconfig` to `.gitignore`
- [ ] Created `Secrets.xcconfig.template` for team
- [ ] Assigned `Secrets.xcconfig` to Debug configuration
- [ ] Assigned `Secrets.xcconfig` to Release configuration

### 10. Info.plist Configuration
- [ ] Added `SUPABASE_URL` → `$(SUPABASE_URL)`
- [ ] Added `SUPABASE_ANON_KEY` → `$(SUPABASE_ANON_KEY)`
- [ ] Added `TMDB_API_KEY` → `$(TMDB_API_KEY)`

Example Info.plist:
```xml
<key>SUPABASE_URL</key>
<string>$(SUPABASE_URL)</string>
<key>SUPABASE_ANON_KEY</key>
<string>$(SUPABASE_ANON_KEY)</string>
<key>TMDB_API_KEY</key>
<string>$(TMDB_API_KEY)</string>
```

### 11. Service Files Added
- [ ] `SupabaseConfig.swift` - Supabase client configuration
- [ ] `AuthService.swift` - Authentication management
- [ ] `ReviewService.swift` - Review/rating operations
- [ ] `WatchlistService.swift` - Watchlist management
- [ ] `TMDBModels.swift` - TMDB data models
- [ ] `TMDBService.swift` - TMDB API client
- [ ] `MediaService.swift` - Integrated TMDB + Supabase service

### 12. Build & Compile
- [ ] Project builds successfully (Cmd+B)
- [ ] No compilation errors
- [ ] No missing module errors
- [ ] Clean build folder tested (Cmd+Shift+K)

---

## 🧪 Testing

### 13. Supabase Connection Test
```swift
// Test in a view or preview
Task {
    do {
        let client = SupabaseConfig.shared.client
        let result: [Profile] = try await client.database
            .from("profiles")
            .select()
            .limit(1)
            .execute()
            .value
        print("✅ Supabase connected!")
    } catch {
        print("❌ Error: \(error)")
    }
}
```

- [ ] Connection successful
- [ ] Console shows: `✅ Supabase configured with URL: ...`
- [ ] No authentication errors

### 14. TMDB Connection Test
```swift
// Test TMDB API
Task {
    do {
        let movies = try await TMDBService.shared.getTrendingMovies()
        print("✅ TMDB connected! Loaded \(movies.count) movies")
    } catch {
        print("❌ Error: \(error)")
    }
}
```

- [ ] Connection successful
- [ ] Console shows: `✅ TMDB API configured`
- [ ] Trending movies loaded
- [ ] No 401 (unauthorized) errors

### 15. Authentication Flow Test
```swift
let authService = AuthService()

// Test signup
try await authService.signUp(
    email: "test@example.com",
    password: "testpass123"
)
```

- [ ] Can create new user
- [ ] Profile auto-created in `profiles` table
- [ ] Can sign in with credentials
- [ ] Can sign out
- [ ] `AuthService.isAuthenticated` updates correctly

### 16. Review System Test
```swift
let reviewService = ReviewService()

// Submit review
let review = try await reviewService.submitReview(
    userId: userId,
    mediaId: 550, // Fight Club
    mediaType: .movie,
    rating: 9.0,
    comment: "Great movie!"
)

// Get average
let avg = try await reviewService.getAverageRating(
    for: 550,
    mediaType: .movie
)
```

- [ ] Can submit review
- [ ] Review appears in Supabase table
- [ ] Can fetch reviews
- [ ] Average rating calculated correctly
- [ ] Can update review
- [ ] Can delete review

### 17. Watchlist Test
```swift
let watchlistService = WatchlistService()

// Add to watchlist
try await watchlistService.addToWatchlist(
    userId: userId,
    mediaId: 550,
    mediaType: .movie
)

// Check status
let isInList = try await watchlistService.isInWatchlist(
    userId: userId,
    mediaId: 550,
    mediaType: .movie
)
```

- [ ] Can add to watchlist
- [ ] Can check if item in watchlist
- [ ] Can remove from watchlist
- [ ] Toggle function works

### 18. Integrated MediaService Test
```swift
let mediaService = MediaService()

// Get trending with user data
let movies = try await mediaService.getTrendingMovies(userId: userId)

// Get details with enriched data
let movie = try await mediaService.getMovieDetails(id: 550, userId: userId)
print("Community rating: \(movie.averageRating)")
print("User rating: \(movie.userRating ?? 0)")
print("In watchlist: \(movie.isInWatchlist)")
```

- [ ] Trending movies load with TMDB data
- [ ] Community ratings from Supabase included
- [ ] User ratings included (if logged in)
- [ ] Watchlist status included (if logged in)
- [ ] Detail view loads full data

---

## 🔒 Security Verification

### 19. Row Level Security (RLS)
Test these scenarios:

**Profiles:**
- [ ] Can view profiles when not logged in
- [ ] Cannot update another user's profile
- [ ] Can update own profile when logged in

**Reviews:**
- [ ] Can read reviews when not logged in
- [ ] Cannot submit review when not logged in
- [ ] Can submit review when logged in
- [ ] Cannot update another user's review
- [ ] Can update own review

**Watchlist:**
- [ ] Cannot see other users' watchlists
- [ ] Can only modify own watchlist

### 20. Data Validation
- [ ] Cannot rate outside 0-10 range
- [ ] Cannot use invalid media_type
- [ ] Cannot create duplicate review
- [ ] Cannot add same item to watchlist twice
- [ ] Email must be unique

### 21. Credentials Security
- [ ] `Secrets.xcconfig` in `.gitignore`
- [ ] No credentials hardcoded in Swift files
- [ ] No credentials committed to git
- [ ] Template file available for team

---

## 🎨 UI Integration

### 22. Home Screen
- [ ] Displays trending movies from TMDB
- [ ] Displays popular TV shows from TMDB
- [ ] Shows community ratings from Supabase
- [ ] Poster images load correctly
- [ ] Navigation to detail view works

### 23. Search Screen
- [ ] Search queries TMDB API
- [ ] Results display correctly
- [ ] Movie and TV search both work
- [ ] Multi-search combines results
- [ ] Tapping result navigates to detail

### 24. Detail Screen
- [ ] TMDB metadata displayed (title, overview, etc.)
- [ ] Backdrop/poster images load
- [ ] Cast list displayed
- [ ] Trailer link works
- [ ] TMDB rating vs community rating shown
- [ ] User's rating pre-filled if exists
- [ ] Can submit/update rating
- [ ] Can add/remove from watchlist

### 25. Authentication Screens
- [ ] Sign up screen functional
- [ ] Login screen functional
- [ ] Password reset works
- [ ] Validation errors shown
- [ ] Loading states shown
- [ ] Successful auth redirects properly

### 26. Profile/Watchlist Screen
- [ ] Displays user's watchlist
- [ ] Shows user's reviews
- [ ] Can remove from watchlist
- [ ] Can edit reviews
- [ ] Sign out works

---

## 📊 Performance & Polish

### 27. Loading States
- [ ] Show loading indicators during API calls
- [ ] Skeleton screens for content loading
- [ ] Pull-to-refresh implemented
- [ ] Pagination for long lists

### 28. Error Handling
- [ ] Network errors handled gracefully
- [ ] User-friendly error messages
- [ ] Retry mechanisms for failed requests
- [ ] Offline mode considerations

### 29. Image Loading
- [ ] Images load asynchronously
- [ ] Placeholder images shown
- [ ] Failed images handled
- [ ] Image caching implemented

### 30. Optimization
- [ ] API calls are batched where possible
- [ ] Duplicate requests prevented
- [ ] Data cached appropriately
- [ ] App responsive during network calls

---

## 🚀 Deployment Preparation

### 31. Environment Management
- [ ] Development credentials configured
- [ ] Production credentials ready (if different)
- [ ] Configuration switches for dev/prod
- [ ] API rate limits understood

### 32. Testing
- [ ] Unit tests for services
- [ ] Integration tests for API calls
- [ ] UI tests for critical flows
- [ ] Test with poor network conditions
- [ ] Test in airplane mode

### 33. Documentation
- [ ] README updated
- [ ] API usage documented
- [ ] Setup instructions for new developers
- [ ] Known issues documented

### 34. Final Checks
- [ ] No test credentials in code
- [ ] No debug print statements in production
- [ ] App icon and assets ready
- [ ] Privacy policy mentions data usage
- [ ] TMDB attribution included

---

## ✅ Success Criteria

Your integration is complete when:

- ✅ Users can browse movies/TV from TMDB
- ✅ Users can search for content
- ✅ Users can sign up and log in
- ✅ Users can rate and review content
- ✅ Community ratings are displayed
- ✅ Users can manage watchlist
- ✅ All API calls work reliably
- ✅ Error states handled gracefully
- ✅ App performs well with real data
- ✅ No secrets committed to git

---

## 📚 Documentation Reference

- **`SUPABASE_SETUP.md`** - Detailed Supabase setup guide
- **`TMDB_SETUP.md`** - Detailed TMDB setup guide
- **`DATABASE_SCHEMA.md`** - Database schema reference
- **`CONFIGURATION_SETUP.md`** - Configuration file setup

---

## 🐛 Common Issues

### Issue: "No such module 'Supabase'"
**Solution:**
- Install package via File → Add Package Dependencies
- Clean build folder (Cmd+Shift+K)
- Restart Xcode

### Issue: "Configuration missing"
**Solution:**
- Check `Secrets.xcconfig` has values
- Check `Info.plist` references $(VARIABLES)
- Verify configuration assigned to target

### Issue: TMDB 401 Unauthorized
**Solution:**
- Verify API key is correct
- Check for extra spaces in key
- Regenerate key if needed

### Issue: Supabase RLS policy violation
**Solution:**
- Check user is authenticated
- Verify policies in table settings
- Check auth.uid() matches user_id

### Issue: Images not loading
**Solution:**
- Check poster/backdrop paths exist
- Verify image URL is correct
- Test URL in browser

---

## 🎯 Next Actions

Once all items are checked:

1. **Build home screen** with trending content
2. **Implement search** functionality
3. **Create detail views** with full integration
4. **Add authentication flow** (signup/login)
5. **Implement review submission**
6. **Add watchlist management**
7. **Polish UI/UX**
8. **Test thoroughly**
9. **Prepare for TestFlight**

---

**Last Updated:** April 16, 2026  
**Project:** CINERATE  
**APIs:** Supabase + TMDB v3  
**Status:** Ready for integration

