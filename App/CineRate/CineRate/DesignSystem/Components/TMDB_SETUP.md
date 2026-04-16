# TMDB API Setup Guide for CINERATE

## Overview
This guide walks you through setting up The Movie Database (TMDB) API integration for CINERATE. TMDB provides comprehensive data about movies and TV shows including metadata, images, cast, crew, and more.

---

## Step 1: Create TMDB Account

1. Visit [themoviedb.org](https://www.themoviedb.org/)
2. Click **"Join TMDb"** in the top right
3. Fill out the registration form
4. Verify your email address

---

## Step 2: Request API Access

1. Log in to your TMDB account
2. Go to your account settings:
   - Click on your **avatar/profile icon** (top right)
   - Select **Settings**
3. Navigate to **API** in the left sidebar
4. Click **"Request an API Key"**
5. Select **"Developer"** (for non-commercial use)
6. Accept the Terms of Use
7. Fill out the application form:
   - **Type of Use**: Personal/Educational
   - **Application Name**: CINERATE
   - **Application URL**: Leave blank or use your repo URL
   - **Application Summary**: "iOS movie and TV show rating app for personal use"
8. Click **Submit**

**Your API key will be generated immediately!**

---

## Step 3: Get Your API Credentials

After approval, you'll see your API credentials:

### API Key (v3 auth)
```
Example: a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

### API Read Access Token (v4 auth) - Optional
```
Example: eyJhbGciOiJIUzI1NiJ9...
```

**For CINERATE, you only need the API Key (v3 auth).**

---

## Step 4: Add API Key to Secrets.xcconfig

Your `Secrets.xcconfig` file has already been updated with placeholders. Now add your actual API key:

```
// TMDB API Configuration
TMDB_API_KEY = YOUR_ACTUAL_API_KEY_HERE
TMDB_ACCESS_TOKEN = YOUR_ACCESS_TOKEN_HERE (optional)
```

**Example:**
```
TMDB_API_KEY = a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6
```

---

## Step 5: Update Info.plist

Add the TMDB API key to your `Info.plist` so it can be read at runtime:

### Using Xcode GUI
1. Open `Info.plist`
2. Add new row:
   - **Key**: `TMDB_API_KEY`
   - **Type**: String
   - **Value**: `$(TMDB_API_KEY)`

### Using XML Editor
```xml
<key>TMDB_API_KEY</key>
<string>$(TMDB_API_KEY)</string>
```

Your Info.plist should now have:
```xml
<!-- Supabase Configuration -->
<key>SUPABASE_URL</key>
<string>$(SUPABASE_URL)</string>
<key>SUPABASE_ANON_KEY</key>
<string>$(SUPABASE_ANON_KEY)</string>

<!-- TMDB API Configuration -->
<key>TMDB_API_KEY</key>
<string>$(TMDB_API_KEY)</string>
```

---

## Step 6: Test Your Setup

Build and run your app. You should see in the console:

```
✅ TMDB API configured
```

### Create a Test View

Add this to test the TMDB integration:

```swift
import SwiftUI

struct TMDBTestView: View {
    @State private var movies: [TMDBMovie] = []
    @State private var status = "Loading..."
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text(status)
                        .foregroundColor(status.contains("✅") ? .green : .primary)
                }
                
                Section("Trending Movies") {
                    ForEach(movies) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            if let overview = movie.overview {
                                Text(overview)
                                    .font(.caption)
                                    .lineLimit(2)
                            }
                            Text("Rating: \(movie.voteAverage ?? 0, specifier: "%.1f")/10")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("TMDB Test")
            .task {
                await loadMovies()
            }
        }
    }
    
    func loadMovies() async {
        do {
            movies = try await TMDBService.shared.getTrendingMovies()
            status = "✅ Loaded \(movies.count) movies"
        } catch {
            status = "❌ Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    TMDBTestView()
}
```

---

## API Usage Examples

### Fetch Trending Movies

```swift
let tmdb = TMDBService.shared

// Get trending movies
let trendingMovies = try await tmdb.getTrendingMovies()

// Get popular movies
let popularMovies = try await tmdb.getPopularMovies()

// Get top rated movies
let topRatedMovies = try await tmdb.getTopRatedMovies()
```

### Fetch Movie Details

```swift
// Get full movie details with credits and videos
let movie = try await tmdb.getMovieDetails(id: 550) // Fight Club

// Get just the credits
let credits = try await tmdb.getMovieCredits(id: 550)

// Get videos (trailers, teasers)
let videos = try await tmdb.getMovieVideos(id: 550)
```

### Search

```swift
// Search for movies
let movieResults = try await tmdb.searchMovies(query: "Inception")

// Search for TV shows
let tvResults = try await tmdb.searchTVShows(query: "Breaking Bad")

// Multi-search (movies, TV, people)
let allResults = try await tmdb.multiSearch(query: "Nolan")
```

### TV Shows

```swift
// Get trending TV shows
let trendingTV = try await tmdb.getTrendingTVShows()

// Get TV show details
let tvShow = try await tmdb.getTVShowDetails(id: 1396) // Breaking Bad

// Get TV show credits
let tvCredits = try await tmdb.getTVShowCredits(id: 1396)
```

### Discover with Filters

```swift
// Discover action movies from 2023
let actionMovies = try await tmdb.discoverMovies(
    genre: 28, // Action genre ID
    year: 2023,
    sortBy: "popularity.desc"
)

// Discover drama TV shows
let dramaShows = try await tmdb.discoverTVShows(
    genre: 18, // Drama genre ID
    sortBy: "vote_average.desc"
)
```

### Images

```swift
// Get poster image URL
if let posterPath = movie.posterPath {
    let posterURL = tmdb.imageURL(path: posterPath, size: .poster)
    // Use with AsyncImage or URLSession
}

// Get backdrop image URL
if let backdropPath = movie.backdropPath {
    let backdropURL = tmdb.imageURL(path: backdropPath, size: .backdrop)
}

// Get profile image URL (for cast)
if let profilePath = castMember.profilePath {
    let profileURL = tmdb.imageURL(path: profilePath, size: .profile)
}
```

---

## Available Endpoints

### Movies
- ✅ `getTrendingMovies()` - Today's trending movies
- ✅ `getPopularMovies()` - Popular movies
- ✅ `getTopRatedMovies()` - Highest rated movies
- ✅ `getNowPlayingMovies()` - Currently in theaters
- ✅ `getUpcomingMovies()` - Coming soon
- ✅ `getMovieDetails(id:)` - Full movie information
- ✅ `getMovieCredits(id:)` - Cast and crew
- ✅ `getMovieVideos(id:)` - Trailers and clips
- ✅ `getSimilarMovies(id:)` - Similar recommendations

### TV Shows
- ✅ `getTrendingTVShows()` - Today's trending shows
- ✅ `getPopularTVShows()` - Popular shows
- ✅ `getTopRatedTVShows()` - Highest rated shows
- ✅ `getAiringTodayTVShows()` - Airing today
- ✅ `getOnTheAirTVShows()` - Currently on air
- ✅ `getTVShowDetails(id:)` - Full show information
- ✅ `getTVShowCredits(id:)` - Cast and crew
- ✅ `getTVShowVideos(id:)` - Trailers and clips
- ✅ `getSimilarTVShows(id:)` - Similar recommendations

### Search
- ✅ `searchMovies(query:)` - Search for movies
- ✅ `searchTVShows(query:)` - Search for TV shows
- ✅ `multiSearch(query:)` - Search everything

### Discover
- ✅ `discoverMovies(genre:year:sortBy:)` - Filter movies
- ✅ `discoverTVShows(genre:year:sortBy:)` - Filter TV shows

### Genres
- ✅ `getMovieGenres()` - List of movie genres
- ✅ `getTVGenres()` - List of TV genres

---

## Common Genre IDs

### Movies
- **Action**: 28
- **Adventure**: 12
- **Animation**: 16
- **Comedy**: 35
- **Crime**: 80
- **Documentary**: 99
- **Drama**: 18
- **Family**: 10751
- **Fantasy**: 14
- **History**: 36
- **Horror**: 27
- **Music**: 10402
- **Mystery**: 9648
- **Romance**: 10749
- **Science Fiction**: 878
- **TV Movie**: 10770
- **Thriller**: 53
- **War**: 10752
- **Western**: 37

### TV Shows
- **Action & Adventure**: 10759
- **Animation**: 16
- **Comedy**: 35
- **Crime**: 80
- **Documentary**: 99
- **Drama**: 18
- **Family**: 10751
- **Kids**: 10762
- **Mystery**: 9648
- **News**: 10763
- **Reality**: 10764
- **Sci-Fi & Fantasy**: 10765
- **Soap**: 10766
- **Talk**: 10767
- **War & Politics**: 10768
- **Western**: 37

---

## Image Sizes

TMDB provides multiple image sizes. The service uses these defaults:

- **Posters**: `w500` (500px wide)
- **Backdrops**: `w1280` (1280px wide)
- **Profiles**: `w185` (185px wide)

Available sizes:
- Posters: `w92`, `w154`, `w185`, `w342`, `w500`, `w780`, `original`
- Backdrops: `w300`, `w780`, `w1280`, `original`
- Profiles: `w45`, `w185`, `h632`, `original`

---

## Rate Limits

TMDB API v3 has generous rate limits:
- **40 requests per 10 seconds** per IP address
- **No daily limit** on the free tier

**Best Practices:**
- Cache responses when possible
- Batch requests where feasible
- Don't make redundant API calls

---

## Converting TMDB Data to App Models

The `TMDBModels.swift` file includes helper methods to convert TMDB models to your app's `Media` model:

```swift
// Convert movie
let tmdbMovie = try await TMDBService.shared.getMovieDetails(id: 550)
let credits = try await TMDBService.shared.getMovieCredits(id: 550)
let videos = try await TMDBService.shared.getMovieVideos(id: 550)

let media = tmdbMovie.toMedia(credits: credits, videos: videos)

// Convert TV show
let tmdbShow = try await TMDBService.shared.getTVShowDetails(id: 1396)
let tvCredits = try await TMDBService.shared.getTVShowCredits(id: 1396)
let tvVideos = try await TMDBService.shared.getTVShowVideos(id: 1396)

let tvMedia = tmdbShow.toMedia(credits: tvCredits, videos: tvVideos)
```

---

## Combining TMDB + Supabase

Here's how to use both APIs together:

```swift
// 1. Fetch movie from TMDB
let movie = try await TMDBService.shared.getMovieDetails(id: 550)

// 2. Get community rating from Supabase
let avgRating = try await ReviewService().getAverageRating(
    for: 550,
    mediaType: .movie
)

// 3. Get user's review if logged in
if let userId = authService.currentUser?.id {
    let userReview = try await ReviewService().getUserReview(
        userId: userId,
        mediaId: 550,
        mediaType: .movie
    )
}

// 4. Check if in watchlist
if let userId = authService.currentUser?.id {
    let isInWatchlist = try await WatchlistService().isInWatchlist(
        userId: userId,
        mediaId: 550,
        mediaType: .movie
    )
}

// 5. Combine all data
var media = movie.toMedia()
media.averageRating = avgRating.averageRating
media.totalRatings = avgRating.totalReviews
media.userRating = userReview?.rating
media.isInWatchlist = isInWatchlist
```

---

## Troubleshooting

### "TMDB API key missing" Error
- ✅ Check `Secrets.xcconfig` has `TMDB_API_KEY = your_key`
- ✅ Check `Info.plist` has `TMDB_API_KEY` with value `$(TMDB_API_KEY)`
- ✅ Clean and rebuild (Cmd+Shift+K)
- ✅ Restart Xcode

### 401 Unauthorized Error
- ✅ Verify API key is correct (copy from TMDB settings)
- ✅ Make sure there are no extra spaces in the key
- ✅ Check API key hasn't been revoked

### 404 Not Found Error
- ✅ Verify the movie/TV show ID is correct
- ✅ Some content may not exist in TMDB

### Images Not Loading
- ✅ Check `posterPath` or `backdropPath` is not nil
- ✅ Verify image URL is correctly formed
- ✅ Test URL in browser first

### Slow Performance
- ✅ Cache frequently accessed data
- ✅ Use pagination (don't load everything at once)
- ✅ Implement lazy loading for images
- ✅ Consider background fetching

---

## Security Best Practices

### ✅ Safe for Client Apps
- The TMDB API key **can** be included in iOS apps
- It's **read-only** and has rate limiting
- TMDB expects keys to be in client applications

### ⚠️ Still Use Config Files
- Keep keys in `Secrets.xcconfig` for easy management
- Don't commit keys directly in code
- Use different keys for development/production if needed

### 🔒 Additional Protection (Optional)
If you want extra security:
1. Use a backend proxy to hide the API key
2. Implement request signing
3. Use TMDB's v4 API with read access tokens

---

## Next Steps

1. ✅ Get TMDB API key
2. ✅ Add to `Secrets.xcconfig`
3. ✅ Update `Info.plist`
4. ✅ Test with sample code
5. ⬜ Integrate into home screen
6. ⬜ Add search functionality
7. ⬜ Implement detail views
8. ⬜ Combine with Supabase reviews

---

## Resources

- [TMDB API Documentation](https://developers.themoviedb.org/3)
- [TMDB API Settings](https://www.themoviedb.org/settings/api)
- [Image Documentation](https://developers.themoviedb.org/3/getting-started/images)
- [Community Forum](https://www.themoviedb.org/talk)

---

## API Attribution

TMDB requires attribution in your app. Add this to your About/Credits screen:

```
This product uses the TMDB API but is not endorsed or certified by TMDB.
```

Include the TMDB logo (downloadable from their website) where appropriate.

---

**Last Updated:** April 16, 2026  
**API Version:** v3  
**Status:** Ready to use

