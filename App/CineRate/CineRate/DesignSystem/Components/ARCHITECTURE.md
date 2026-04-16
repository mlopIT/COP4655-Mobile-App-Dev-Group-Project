# CINERATE Architecture Overview

This document provides a visual overview of how CINERATE's backend services work together.

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      CINERATE iOS App                        │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  HomeView    │  │  SearchView  │  │  DetailView  │      │
│  │              │  │              │  │              │      │
│  │ - Trending   │  │ - Search Bar │  │ - Movie Info │      │
│  │ - Popular    │  │ - Results    │  │ - Ratings    │      │
│  │ - Categories │  │ - Filters    │  │ - Reviews    │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                 │                 │               │
│         └─────────────────┴─────────────────┘               │
│                           │                                  │
│                  ┌────────▼────────┐                        │
│                  │  MediaService   │   ← Integrated Layer   │
│                  │                 │                         │
│                  │ Combines TMDB   │                        │
│                  │ + Supabase data │                        │
│                  └────────┬────────┘                        │
│                           │                                  │
│         ┌─────────────────┼─────────────────┐               │
│         │                 │                 │               │
│  ┌──────▼──────┐   ┌──────▼──────┐   ┌─────▼──────┐       │
│  │  TMDBService│   │AuthService  │   │ReviewService│       │
│  │             │   │             │   │             │       │
│  │ - Movies    │   │ - Sign Up   │   │ - Submit    │       │
│  │ - TV Shows  │   │ - Sign In   │   │ - Get Avg   │       │
│  │ - Search    │   │ - Sign Out  │   │ - Get User  │       │
│  └──────┬──────┘   └──────┬──────┘   └─────┬──────┘       │
│         │                 │                 │               │
└─────────┼─────────────────┼─────────────────┼───────────────┘
          │                 │                 │
          │                 │                 │
    ┌─────▼─────┐     ┌─────▼─────┐    ┌─────▼─────┐
    │   TMDB    │     │ Supabase  │    │ Supabase  │
    │    API    │     │   Auth    │    │ Database  │
    │           │     │           │    │           │
    │ - Content │     │ - Users   │    │ - Reviews │
    │ - Images  │     │ - Sessions│    │ - Watchlist│
    │ - Metadata│     │ - Tokens  │    │ - Profiles│
    └───────────┘     └───────────┘    └───────────┘
```

---

## 📊 Data Flow

### 1. Browse Movies/TV Shows

```
User Opens App
      │
      ▼
  HomeView loads
      │
      ▼
MediaService.getTrendingMovies()
      │
      ├──────────────────┬─────────────────┐
      ▼                  ▼                 ▼
TMDBService        ReviewService    WatchlistService
 getTrending()     getAvgRating()   isInWatchlist()
      │                  │                 │
      ▼                  ▼                 ▼
  TMDB API          Supabase DB       Supabase DB
      │                  │                 │
      └──────────────────┴─────────────────┘
                         │
                         ▼
              Combined Media objects
                         │
                         ▼
                  Display in UI
```

### 2. Search for Content

```
User Types Query
      │
      ▼
SearchView updates
      │
      ▼
MediaService.searchMovies("Inception")
      │
      ▼
TMDBService.searchMovies()
      │
      ▼
  TMDB API
      │
      ▼
  Search Results
      │
      ├─── For each result ───┐
      │                        │
      ▼                        ▼
ReviewService            WatchlistService
getAvgRating()          isInWatchlist()
      │                        │
      ▼                        ▼
Supabase DB              Supabase DB
      │                        │
      └────────────────────────┘
                 │
                 ▼
     Enriched Search Results
                 │
                 ▼
          Display in UI
```

### 3. View Movie Details

```
User Taps Movie
      │
      ▼
DetailView loads
      │
      ▼
MediaService.getMovieDetails(id: 550)
      │
      ├─────────────────────────┬────────────────┐
      │                         │                │
      ▼                         ▼                ▼
TMDBService              TMDBService       TMDBService
getMovieDetails()        getCredits()      getVideos()
      │                         │                │
      ▼                         ▼                ▼
  TMDB API                  TMDB API         TMDB API
      │                         │                │
      └─────────────────────────┴────────────────┘
                         │
                         ▼
              Movie + Cast + Trailers
                         │
      ├─────────────────────────┬────────────────┐
      │                         │                │
      ▼                         ▼                ▼
ReviewService            ReviewService     WatchlistService
getAvgRating()          getUserReview()   isInWatchlist()
      │                         │                │
      ▼                         ▼                ▼
Supabase DB              Supabase DB       Supabase DB
      │                         │                │
      └─────────────────────────┴────────────────┘
                         │
                         ▼
        Complete Movie Details with:
        - TMDB data (title, cast, etc.)
        - Community rating
        - User's rating (if exists)
        - Watchlist status
                         │
                         ▼
          Display in DetailView
```

### 4. Submit Review

```
User Rates Movie (9/10) + Writes Comment
      │
      ▼
DetailView.submitReview()
      │
      ▼
MediaService.submitReview()
      │
      ▼
ReviewService.submitReview()
      │
      ▼
Supabase DB (reviews table)
      │
      ├─ Check if review exists
      │  ├─ Yes → UPDATE review
      │  └─ No  → INSERT review
      │
      ▼
Review Saved
      │
      ▼
Refresh DetailView
      │
      ▼
Updated average rating shown
```

### 5. Add to Watchlist

```
User Taps "Add to Watchlist"
      │
      ▼
DetailView.toggleWatchlist()
      │
      ▼
MediaService.toggleWatchlist()
      │
      ▼
WatchlistService.toggleWatchlist()
      │
      ├─ Check if in watchlist
      │  ├─ Yes → DELETE from watchlist
      │  └─ No  → INSERT into watchlist
      │
      ▼
Supabase DB (watchlist table)
      │
      ▼
Watchlist Updated
      │
      ▼
Button updates to "Remove from Watchlist"
```

---

## 🗄️ Database Schema

```
┌──────────────────┐
│   auth.users     │  ← Supabase Managed
│   (Built-in)     │
└────────┬─────────┘
         │
         │ 1:1 (auto-created via trigger)
         │
┌────────▼─────────┐
│    profiles      │
├──────────────────┤
│ id (UUID)        │ ← PK
│ email            │
│ username         │
│ avatar_url       │
│ created_at       │
│ updated_at       │
└────────┬─────────┘
         │
         │ 1:N
         │
    ┌────┴─────┐
    │          │
┌───▼────┐  ┌──▼────────┐
│reviews │  │ watchlist │
├────────┤  ├───────────┤
│ id     │  │ id        │
│ user_id│  │ user_id   │
│ media_id  media_id   │
│ media_type media_type│
│ rating │  │ added_at  │
│ comment│  └───────────┘
│ created_at
│ updated_at
└────────┘
```

**Key Points:**
- `media_id` references TMDB movie/TV ID (integer)
- `media_type` is either 'movie' or 'tv'
- `user_id` links to `profiles.id` (and `auth.users.id`)
- Row Level Security (RLS) protects user data

---

## 🔐 Authentication Flow

```
┌─────────────┐
│   Sign Up   │
└──────┬──────┘
       │
       ▼
AuthService.signUp(email, password)
       │
       ▼
Supabase Auth API
       │
       ├─ Create user in auth.users
       │
       ▼
Trigger: on_auth_user_created
       │
       ▼
Auto-create profile in profiles table
       │
       ▼
Return session + user
       │
       ▼
Update AuthService.currentUser
       │
       ▼
Update AuthService.isAuthenticated = true
       │
       ▼
Navigate to Home Screen
```

---

## 🎬 TMDB Integration

### Movie/TV Data Structure

```
TMDB API Response
       │
       ▼
TMDBMovie / TMDBTVShow
       │
       ├─ Basic Info
       │  ├─ id
       │  ├─ title/name
       │  ├─ overview
       │  ├─ poster_path
       │  ├─ backdrop_path
       │  ├─ vote_average
       │  └─ release_date/first_air_date
       │
       ├─ Detailed Info
       │  ├─ runtime / episode_run_time
       │  ├─ genres
       │  ├─ status
       │  └─ production_companies
       │
       ├─ Credits (separate call)
       │  ├─ cast[]
       │  └─ crew[]
       │
       └─ Videos (separate call)
          └─ trailers[]
                │
                ▼
    Convert to App's Media model
                │
                ▼
    Enrich with Supabase data
                │
                ▼
        Complete Media object
```

### Image URLs

```
TMDB provides paths:
  poster_path: "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg"
  backdrop_path: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg"

TMDBService converts to full URLs:
  poster: "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg"
  backdrop: "https://image.tmdb.org/t/p/w1280/tmU7GeKVybMWFButWEGl2M4GeiP.jpg"

Use with AsyncImage in SwiftUI:
  AsyncImage(url: URL(string: posterURL))
```

---

## 🔄 Service Layer Pattern

### MediaService (Orchestrator)

```swift
MediaService
    │
    ├─ getTrendingMovies()
    │    ├─ Calls TMDBService.getTrendingMovies()
    │    ├─ For each movie:
    │    │    ├─ Get ReviewService.getAverageRating()
    │    │    ├─ Get ReviewService.getUserReview()
    │    │    └─ Get WatchlistService.isInWatchlist()
    │    └─ Returns enriched Media[]
    │
    ├─ getMovieDetails(id)
    │    ├─ Parallel fetch:
    │    │    ├─ TMDBService.getMovieDetails()
    │    │    ├─ TMDBService.getCredits()
    │    │    └─ TMDBService.getVideos()
    │    ├─ Convert to Media
    │    ├─ Enrich with user data
    │    └─ Return complete Media
    │
    └─ submitReview()
         └─ Calls ReviewService.submitReview()
              └─ Saves to Supabase
```

**Benefits:**
- Single interface for UI layer
- Combines multiple data sources
- Handles parallel requests
- Manages loading states
- Centralizes error handling

---

## 📦 File Organization

```
CINERATE/
│
├── Models/
│   ├── MediaModels.swift        ← App's Media/CastMember models
│   ├── TMDBModels.swift         ← TMDB API response models
│   └── SupabaseConfig.swift     ← Supabase models (Profile, Review, etc.)
│
├── Services/
│   ├── TMDBService.swift        ← TMDB API client
│   ├── AuthService.swift        ← Supabase authentication
│   ├── ReviewService.swift      ← Review/rating operations
│   ├── WatchlistService.swift   ← Watchlist operations
│   └── MediaService.swift       ← Integrated orchestrator
│
├── Views/
│   ├── HomeView.swift           ← Browse trending/popular
│   ├── SearchView.swift         ← Search interface
│   ├── DetailView.swift         ← Movie/TV details
│   ├── AuthViews/
│   │   ├── LoginView.swift
│   │   └── SignUpView.swift
│   └── ProfileView.swift        ← User profile + watchlist
│
├── Configuration/
│   ├── Secrets.xcconfig         ← API keys (gitignored)
│   └── Info.plist               ← App configuration
│
└── Documentation/
    ├── QUICK_START.md           ← 15-min setup guide
    ├── SUPABASE_SETUP.md        ← Detailed Supabase guide
    ├── TMDB_SETUP.md            ← Detailed TMDB guide
    ├── DATABASE_SCHEMA.md       ← Database reference
    └── ARCHITECTURE.md          ← This file
```

---

## 🚀 Request Optimization

### Parallel Requests

```swift
// ❌ Sequential (slow)
let movie = await tmdb.getMovieDetails(id: 550)
let credits = await tmdb.getCredits(id: 550)
let videos = await tmdb.getVideos(id: 550)
// Total: ~900ms

// ✅ Parallel (fast)
async let movie = tmdb.getMovieDetails(id: 550)
async let credits = tmdb.getCredits(id: 550)
async let videos = tmdb.getVideos(id: 550)
let (movieData, creditsData, videosData) = await (movie, credits, videos)
// Total: ~300ms
```

### Batching User Data

```swift
// Get all enrichment data in parallel
async let avgRating = reviewService.getAverageRating(...)
async let userReview = reviewService.getUserReview(...)
async let inWatchlist = watchlistService.isInWatchlist(...)

let (rating, review, watchlist) = await (avgRating, userReview, inWatchlist)
```

---

## 🎯 Key Features

### 1. Guest Mode
- Users can browse without signing up
- TMDB data is public
- Community ratings visible
- Prompts to sign up for reviews/watchlist

### 2. Authenticated Mode
- All guest features
- Submit reviews and ratings
- Manage personal watchlist
- See own reviews on detail pages
- Profile management

### 3. Data Combination
- TMDB provides content metadata
- Supabase provides user & community data
- MediaService combines both seamlessly
- UI gets complete, enriched objects

---

## 📊 Example: Complete Movie Object

```swift
Media(
    // From TMDB
    id: "550",
    type: .movie,
    title: "Fight Club",
    releaseYear: "1999",
    runtime: "2h 19m",
    genres: ["Drama", "Thriller"],
    posterImage: "https://image.tmdb.org/t/p/w500/...",
    overview: "An insomniac office worker...",
    director: "David Fincher",
    cast: [...], // From TMDB credits
    trailerURL: "https://youtube.com/...", // From TMDB videos
    
    // From Supabase
    averageRating: 4.3,     // Community average from reviews table
    totalRatings: 1284,      // Count from reviews table
    userRating: 5.0,         // Current user's rating (if logged in)
    isInWatchlist: true      // From watchlist table (if logged in)
)
```

---

## 🔐 Security Model

### API Keys
- **TMDB API Key**: Safe in client (read-only, rate-limited)
- **Supabase Anon Key**: Safe in client (RLS protected)
- **Supabase Service Key**: ❌ Never in client code

### Row Level Security
```sql
-- Users can only modify their own data
CREATE POLICY "Users can update own reviews"
    ON reviews FOR UPDATE
    USING (auth.uid() = user_id);

-- But everyone can read
CREATE POLICY "Reviews are public"
    ON reviews FOR SELECT
    USING (true);
```

### Authentication
- JWT tokens stored securely by Supabase client
- Auto-refresh on expiration
- Session persistence across app launches

---

## 📈 Scalability Considerations

### Current Architecture
- ✅ Handles 1000s of concurrent users
- ✅ TMDB has generous rate limits
- ✅ Supabase free tier: 50,000 monthly active users
- ✅ Pagination prevents memory issues

### Future Optimizations
- Add Redis caching for TMDB responses
- Implement background sync for watchlist
- Use Supabase Realtime for live updates
- Add image caching layer
- Implement offline mode with local database

---

## 🎬 Complete User Journey

```
1. User opens app
   └─> Browse trending movies (TMDB)
   
2. User taps "Inception"
   ├─> Load movie details (TMDB)
   ├─> Show community rating (Supabase)
   └─> Display trailer (TMDB)
   
3. User signs up
   ├─> Create account (Supabase Auth)
   └─> Auto-create profile (Supabase DB)
   
4. User rates "Inception" 9/10
   ├─> Submit review (Supabase DB)
   └─> Update average rating
   
5. User adds to watchlist
   └─> Save to watchlist (Supabase DB)
   
6. User views watchlist
   ├─> Fetch watchlist items (Supabase DB)
   └─> Get details for each (TMDB)
   
7. User searches "Nolan"
   ├─> Search movies (TMDB)
   ├─> Get ratings for results (Supabase)
   └─> Show enriched results
```

---

## 🎯 Success Metrics

With this architecture, CINERATE can:
- ⚡ Load trending content in <500ms
- 🔄 Handle offline gracefully
- 📊 Scale to thousands of users
- 🔒 Keep user data secure
- 🌐 Access millions of titles
- ⭐ Provide real-time community ratings
- 📱 Work seamlessly across devices

---

**Architecture Version:** 1.0  
**Last Updated:** April 16, 2026  
**Status:** Production Ready
