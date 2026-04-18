# Placeholder Data Replacement Guide

This document identifies all placeholder/mock data in the CINERATE app and provides instructions for replacing it with real API data from TMDB and Supabase.

---

## 📍 Files with Placeholder Data

### 1. **TrendingMovieCard.swift** (MovieHeroView)
**Current Issues:**
- ❌ Hardcoded movie title: "MOVIE NAME PLACEHOLDER"
- ❌ Static background image: `Image("film image")`
- ❌ No actual movie data

**Solution:** Replace with dynamic data from TMDB trending movies API

---

### 2. **TopRatedShowsSection.swift**
**Current Issues:**
- ❌ Hardcoded TV shows:
  - "Daredevil: Born Again"
  - "The Penguin"
  - "Andor"
- ❌ Static images and ratings

**Solution:** Replace with TMDB trending/top-rated TV shows API

---

### 3. **GenreExplore.swift** (ExploreGenresSection)
**Current Issues:**
- ❌ Limited genres: THRILLER, SCIFI, CLASSIC
- ❌ Hardcoded genre images

**Solution:** Use TMDB genres API to get all available genres

---

### 4. **SearchComponents.swift**
**Current Issues:**
- ❌ Hardcoded popular searches: "Action Movies", "Christopher Nolan", etc.
- ❌ Mock recent searches: "Inception", "The Matrix", "Blade Runner"
- ❌ Sample search results with static data

**Solution:** 
- Store recent searches in UserDefaults
- Fetch real search results from TMDB search API
- Show trending searches from TMDB

---

## ✅ Implementation Plan

### Phase 1: Connect Home Screen to TMDB

**File: HomeScreen.swift**
- Add `@StateObject private var mediaService = MediaService()`
- Load trending movies on appear
- Pass data to child components

### Phase 2: Update MovieHeroView

**File: TrendingMovieCard.swift**
- Accept `Media` object as parameter
- Display actual movie title, backdrop, rating
- Navigate to detail screen on tap

### Phase 3: Update TopRatedSection

**File: TopRatedShowsSection.swift**
- Accept `[Media]` array from parent
- Display real TV show data
- Use AsyncImage for posters
- Show actual ratings from TMDB

### Phase 4: Update Genre Explorer

**File: GenreExplore.swift**
- Fetch genres from TMDB genres API
- Display all available genres dynamically
- Filter by media type (movie/tv)

### Phase 5: Implement Real Search

**File: SearchScreen.swift & SearchComponents.swift**
- Connect to TMDB search API
- Store recent searches in UserDefaults
- Debounce search input
- Show real results with AsyncImage

---

## 🔧 Code Updates Required

See the updated files in this commit for full implementation.

---

## 📊 API Endpoints Needed

### TMDB APIs Already Available:
✅ `getTrendingMovies()` - For hero section
✅ `getTrendingTVShows()` - For top rated section
✅ `getPopularMovies()` - Additional content
✅ `getTopRatedTVShows()` - Alternative for trending
✅ `searchMovies()` - Search functionality
✅ `searchTVShows()` - Search functionality
✅ `multiSearch()` - Combined search
✅ Genre endpoints (need to verify in TMDBService)

### Additional Helpers Needed:
- Recent search persistence (UserDefaults)
- Image URL helper (already in Media model)
- Loading/error states
- Empty state handling

---

## 🎯 Next Steps

1. ✅ Review this guide
2. ⏳ Update individual component files
3. ⏳ Test with real data
4. ⏳ Handle loading states
5. ⏳ Add error handling
6. ⏳ Implement caching (optional)

---

**Last Updated:** April 16, 2026
