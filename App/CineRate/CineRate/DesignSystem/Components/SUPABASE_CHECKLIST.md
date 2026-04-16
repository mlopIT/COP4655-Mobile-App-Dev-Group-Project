# Supabase Quick Start Checklist

Use this checklist to verify your Supabase setup is complete and working correctly.

## 🔧 Initial Setup

### 1. Supabase Project Creation
- [ ] Created account at supabase.com
- [ ] Created new project named "cinerate" (or your choice)
- [ ] Saved database password securely
- [ ] Project fully initialized (green status indicator)

### 2. Database Schema Setup
- [ ] Opened SQL Editor in Supabase dashboard
- [ ] Executed the complete schema SQL script
- [ ] Verified tables created: `profiles`, `reviews`, `watchlist`
- [ ] Verified indexes created (check table details)
- [ ] Verified RLS policies enabled (padlock icons on tables)
- [ ] Tested `get_average_rating()` function works

### 3. API Credentials
- [ ] Copied Project URL from Settings → API
- [ ] Copied anon/public key from Settings → API
- [ ] Stored credentials securely (not committed to git)

---

## 📦 Xcode Integration

### 4. Swift Package Installation
- [ ] Added Supabase Swift package to Xcode project
- [ ] Package URL: `https://github.com/supabase/supabase-swift`
- [ ] Selected products: Supabase, Auth, PostgREST
- [ ] Package resolved successfully (no errors)

### 5. Configuration Files
- [ ] Added `SupabaseConfig.swift` to project
- [ ] Updated Project URL in `SupabaseConfig.swift`
- [ ] Updated anon key in `SupabaseConfig.swift`
- [ ] Added `AuthService.swift` to project
- [ ] Added `ReviewService.swift` to project
- [ ] Added `WatchlistService.swift` to project
- [ ] All files compile without errors

---

## 🧪 Testing

### 6. Basic Connection Test
```swift
// Test code - add to a test view or playground
Task {
    let client = SupabaseConfig.shared.client
    do {
        let result = try await client.database
            .from("profiles")
            .select()
            .limit(1)
            .execute()
        print("✅ Database connection successful!")
    } catch {
        print("❌ Connection failed: \(error)")
    }
}
```
- [ ] Connection test successful
- [ ] No authentication errors
- [ ] No network errors

### 7. Authentication Test
```swift
let authService = AuthService()

// Create test account
try await authService.signUp(
    email: "test@example.com",
    password: "testpassword123"
)
```
- [ ] Can create new user account
- [ ] Profile automatically created in `profiles` table
- [ ] Can sign in with created account
- [ ] Can sign out successfully
- [ ] `AuthService.isAuthenticated` updates correctly

### 8. Review System Test
```swift
let reviewService = ReviewService()

// Submit test review
let review = try await reviewService.submitReview(
    userId: authService.currentUser!.id,
    mediaId: 550, // Fight Club
    mediaType: .movie,
    rating: 9.5,
    comment: "Test review"
)

// Get average rating
let avgRating = try await reviewService.getAverageRating(
    for: 550,
    mediaType: .movie
)
```
- [ ] Can submit a new review
- [ ] Review appears in Supabase Table Editor
- [ ] Can retrieve reviews for a media item
- [ ] Average rating calculation works
- [ ] Can update existing review
- [ ] Can delete review

### 9. Watchlist Test
```swift
let watchlistService = WatchlistService()

// Add to watchlist
let added = try await watchlistService.addToWatchlist(
    userId: authService.currentUser!.id,
    mediaId: 550,
    mediaType: .movie
)

// Get watchlist
let items = try await watchlistService.getWatchlist(
    for: authService.currentUser!.id
)
```
- [ ] Can add item to watchlist
- [ ] Can retrieve user's watchlist
- [ ] Can check if item is in watchlist
- [ ] Can remove item from watchlist
- [ ] Toggle function works correctly

---

## 🔒 Security Verification

### 10. Row Level Security (RLS)
Test these scenarios to ensure RLS is working:

**Profiles:**
- [ ] Can view any profile when not logged in
- [ ] Cannot update another user's profile
- [ ] Can update own profile when logged in

**Reviews:**
- [ ] Can read all reviews when not logged in
- [ ] Cannot submit review when not logged in
- [ ] Can submit review when logged in
- [ ] Cannot update/delete another user's review
- [ ] Can update/delete own reviews

**Watchlist:**
- [ ] Cannot see other users' watchlists
- [ ] Can only add to own watchlist
- [ ] Can only remove from own watchlist

### 11. Data Validation
- [ ] Cannot submit rating outside 0-10 range
- [ ] Cannot submit invalid media_type (not 'movie' or 'tv')
- [ ] Cannot create duplicate review for same media item
- [ ] Cannot add same item to watchlist twice
- [ ] Email must be unique per user

---

## 🎨 UI Integration

### 12. Authentication Screens
- [ ] Sign up screen calls `AuthService.signUp()`
- [ ] Login screen calls `AuthService.signIn()`
- [ ] Sign out button calls `AuthService.signOut()`
- [ ] Lazy registration works (prompt to sign in when rating)
- [ ] Error messages displayed to user
- [ ] Loading states shown during API calls

### 13. Detail Screen
- [ ] Displays TMDB rating vs community rating
- [ ] Shows average rating from Supabase
- [ ] Shows total review count
- [ ] Rating UI allows 0-10 selection
- [ ] Submit button posts to Supabase
- [ ] Reviews list loads from Supabase
- [ ] User's existing review is pre-filled if exists

### 14. Profile/Watchlist Screen
- [ ] Displays user's watchlist items
- [ ] Add/remove watchlist buttons work
- [ ] Shows user's submitted reviews
- [ ] Sign out functionality works

---

## 📊 Monitoring & Maintenance

### 15. Supabase Dashboard Checks
- [ ] Check Auth logs for any errors
- [ ] Check API logs for failed requests
- [ ] Check Database logs for query issues
- [ ] Monitor storage usage (Database → Usage)
- [ ] Review rate limits (shouldn't hit on free tier during dev)

### 16. Production Readiness
- [ ] Move credentials to environment variables
- [ ] Add `.gitignore` entry for config files
- [ ] Set up error logging/reporting
- [ ] Configure email templates in Supabase
- [ ] Add loading states for all async operations
- [ ] Add proper error handling throughout app
- [ ] Test app with poor network conditions
- [ ] Test app in airplane mode (graceful failures)

---

## 🐛 Troubleshooting Guide

### Common Issues and Solutions

**"Failed to initialize Supabase client"**
- ✅ Check Project URL format (must include https://)
- ✅ Verify anon key is complete (very long JWT)
- ✅ Ensure project is fully initialized in dashboard

**"Row Level Security policy violation"**
- ✅ Check RLS policies in Table Editor
- ✅ Verify user is authenticated when required
- ✅ Ensure `auth.uid()` matches user_id in policies
- ✅ Check SQL Editor logs for policy errors

**"Cannot insert into table"**
- ✅ Check constraints (unique, check, foreign key)
- ✅ Verify RLS INSERT policy allows operation
- ✅ Check data types match schema
- ✅ Look for helpful error message in response

**"Function 'get_average_rating' does not exist"**
- ✅ Re-run the function creation SQL
- ✅ Check SQL Editor history to see if it executed
- ✅ Verify in Database → Functions list

**"Authentication error"**
- ✅ Check email provider is enabled (Auth → Providers)
- ✅ Verify email format is valid
- ✅ Check Auth logs for specific error
- ✅ Ensure password meets requirements (6+ characters)

**Swift compilation errors**
- ✅ Verify Supabase package installed correctly
- ✅ Check for import statements: `import Supabase`
- ✅ Clean build folder (Cmd+Shift+K)
- ✅ Restart Xcode if needed

---

## 📚 Next Steps

Once all items are checked:

1. **Integrate with TMDB API**
   - Fetch movie/TV data from TMDB
   - Display in home screen
   - Link to detail views

2. **Implement full auth flow**
   - Sign up screen
   - Login screen  
   - Forgot password flow
   - Profile management

3. **Build review UI**
   - Star rating component
   - Review submission form
   - Reviews list view
   - Edit/delete functionality

4. **Add watchlist features**
   - Watchlist tab in app
   - Add/remove buttons
   - Badge showing watchlist count

5. **Polish & Test**
   - Add animations
   - Implement error handling
   - Test edge cases
   - Get feedback from users

---

## 🎯 Success Criteria

Your Supabase integration is complete when:

- ✅ Users can sign up and log in
- ✅ Users can submit and edit reviews
- ✅ Average ratings are calculated correctly
- ✅ Watchlist add/remove works
- ✅ RLS protects user data appropriately
- ✅ All API calls handle errors gracefully
- ✅ App works smoothly with real data
- ✅ No credentials are committed to git

---

## 📞 Resources

- **Supabase Docs**: https://supabase.com/docs
- **Swift Client**: https://github.com/supabase/supabase-swift
- **RLS Guide**: https://supabase.com/docs/guides/auth/row-level-security
- **Community**: https://github.com/supabase/supabase/discussions

---

**Last Updated:** April 16, 2026
**Project:** CINERATE
**Version:** 1.0
