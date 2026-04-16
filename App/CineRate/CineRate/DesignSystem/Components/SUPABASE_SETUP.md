# Supabase Setup Guide for CINERATE

## Overview
This guide walks you through setting up Supabase as the backend for CINERATE, including database schema, authentication, and API integration.

---

## Prerequisites
- A Supabase account (free tier works fine)
- Xcode project set up with Swift Package Manager
- Basic understanding of SQL and REST APIs

---

## Step 1: Create Supabase Project

1. Visit [supabase.com](https://supabase.com) and sign in
2. Click **"New Project"**
3. Configure your project:
   - **Name**: `cinerate` (or your preferred name)
   - **Database Password**: Create a strong password and save it securely
   - **Region**: Select closest to your target audience
   - **Plan**: Free tier is sufficient for development
4. Click **"Create new project"** (takes ~2 minutes to initialize)

---

## Step 2: Set Up Database Schema

### Navigate to SQL Editor
1. In your Supabase dashboard, click **"SQL Editor"** in the left sidebar
2. Click **"New Query"**

### Execute Database Setup Script

Copy and paste the following SQL commands into the editor and click **"Run"**:

```sql
-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Profiles table (extends auth.users)
CREATE TABLE profiles (
    id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    username TEXT UNIQUE,
    avatar_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Reviews table
CREATE TABLE reviews (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
    media_id INTEGER NOT NULL,
    media_type TEXT NOT NULL CHECK (media_type IN ('movie', 'tv')),
    rating DECIMAL(3,1) NOT NULL CHECK (rating >= 0 AND rating <= 10),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
    UNIQUE(user_id, media_id, media_type)
);

-- Watchlist table
CREATE TABLE watchlist (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
    media_id INTEGER NOT NULL,
    media_type TEXT NOT NULL CHECK (media_type IN ('movie', 'tv')),
    added_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
    UNIQUE(user_id, media_id, media_type)
);

-- Create indexes for performance
CREATE INDEX reviews_user_id_idx ON reviews(user_id);
CREATE INDEX reviews_media_id_idx ON reviews(media_id);
CREATE INDEX reviews_media_type_idx ON reviews(media_type);
CREATE INDEX watchlist_user_id_idx ON watchlist(user_id);

-- Enable Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE watchlist ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Public profiles are viewable by everyone"
    ON profiles FOR SELECT USING (true);

CREATE POLICY "Users can update own profile"
    ON profiles FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
    ON profiles FOR INSERT WITH CHECK (auth.uid() = id);

-- Reviews policies
CREATE POLICY "Reviews are viewable by everyone"
    ON reviews FOR SELECT USING (true);

CREATE POLICY "Users can create their own reviews"
    ON reviews FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own reviews"
    ON reviews FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own reviews"
    ON reviews FOR DELETE USING (auth.uid() = user_id);

-- Watchlist policies
CREATE POLICY "Users can view their own watchlist"
    ON watchlist FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can add to their own watchlist"
    ON watchlist FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can remove from their own watchlist"
    ON watchlist FOR DELETE USING (auth.uid() = user_id);

-- Auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email)
    VALUES (new.id, new.email);
    RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Function to get average rating
CREATE OR REPLACE FUNCTION get_average_rating(
    p_media_id INTEGER,
    p_media_type TEXT
)
RETURNS TABLE (
    average_rating DECIMAL,
    total_reviews BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        COALESCE(ROUND(AVG(rating), 1), 0)::DECIMAL as average_rating,
        COUNT(*)::BIGINT as total_reviews
    FROM reviews
    WHERE media_id = p_media_id AND media_type = p_media_type;
END;
$$ LANGUAGE plpgsql;
```

---

## Step 3: Configure Authentication

1. Go to **Authentication** → **Providers** in the sidebar
2. Enable **Email** provider (should be enabled by default)
3. Optional: Configure additional providers (Google, Apple, etc.)

### Email Settings (Optional but Recommended)
1. Go to **Authentication** → **Email Templates**
2. Customize the confirmation and password reset emails with your branding

---

## Step 4: Get Your API Credentials

1. Navigate to **Settings** → **API** in the sidebar
2. Copy the following values:
   - **Project URL**: `https://xxxxx.supabase.co`
   - **anon public key**: Long JWT token starting with `eyJhbGc...`

### ⚠️ Important Security Notes
- The `anon` key is safe to use in your iOS app
- Never expose your `service_role` key in client code
- Store credentials securely (consider using Xcode configuration files)

---

## Step 5: Install Supabase Swift Client

### Add Supabase Package to Xcode

1. Open your Xcode project
2. Go to **File** → **Add Package Dependencies...**
3. Enter the package URL: `https://github.com/supabase/supabase-swift`
4. Select version: **Recommended** (latest stable)
5. Click **Add Package**
6. Select the following products:
   - ✅ Supabase
   - ✅ Auth
   - ✅ PostgREST
   - ✅ Storage (optional, for future features)
   - ✅ Realtime (optional, for future features)
7. Click **Add Package**

---

## Step 6: Configure Your Swift Project

### Update SupabaseConfig.swift

Open `SupabaseConfig.swift` and replace the placeholder values with your actual credentials:

```swift
private init() {
    self.supabaseURL = "https://xxxxx.supabase.co" // Your Project URL
    self.supabaseAnonKey = "eyJhbGc..." // Your anon public key
    
    self.client = SupabaseClient(
        supabaseURL: URL(string: supabaseURL)!,
        supabaseKey: supabaseAnonKey
    )
}
```

### Best Practice: Use Environment Variables

For better security, create a `Config.xcconfig` file:

1. Right-click your project in Xcode
2. Select **New File** → **Configuration Settings File**
3. Name it `Config.xcconfig`
4. Add your credentials:

```
SUPABASE_URL = https:/$()/xxxxx.supabase.co
SUPABASE_ANON_KEY = eyJhbGc...
```

5. Add to `.gitignore`:
```
Config.xcconfig
```

Then update `SupabaseConfig.swift` to read from Info.plist (which reads from xcconfig).

---

## Step 7: Test Your Setup

Create a simple test in your app to verify the connection:

```swift
import SwiftUI

struct SupabaseTestView: View {
    @State private var status = "Testing connection..."
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Supabase Connection Test")
                .font(.headline)
            
            Text(status)
                .foregroundColor(status.contains("✅") ? .green : .primary)
            
            Button("Test Connection") {
                testConnection()
            }
        }
        .padding()
        .onAppear {
            testConnection()
        }
    }
    
    func testConnection() {
        Task {
            do {
                let reviewService = ReviewService()
                let rating = try await reviewService.getAverageRating(
                    for: 1, 
                    mediaType: .movie
                )
                status = "✅ Connected! (Average rating: \(rating.averageRating), Reviews: \(rating.totalReviews))"
            } catch {
                status = "❌ Error: \(error.localizedDescription)"
            }
        }
    }
}
```

---

## Database Schema Summary

### Tables Created

1. **profiles** - User profile information
   - Extends Supabase auth.users
   - Stores username, avatar, timestamps
   - Auto-created on signup

2. **reviews** - User ratings and reviews
   - Links to profiles via user_id
   - Stores media_id, media_type, rating, comment
   - Unique constraint: one review per user per media item

3. **watchlist** - User's saved content
   - Links to profiles via user_id
   - Stores media items user wants to watch
   - Unique constraint: can't add same item twice

### Functions Created

- `get_average_rating(media_id, media_type)` - Calculates average rating and review count
- `handle_new_user()` - Automatically creates profile on user signup

---

## API Usage Examples

### Authentication
```swift
let authService = AuthService()

// Sign up
try await authService.signUp(email: "user@example.com", password: "password")

// Sign in
try await authService.signIn(email: "user@example.com", password: "password")

// Sign out
try await authService.signOut()
```

### Reviews
```swift
let reviewService = ReviewService()

// Get reviews for a movie
let reviews = try await reviewService.getReviews(for: 550, mediaType: .movie)

// Submit a review
try await reviewService.submitReview(
    userId: userId,
    mediaId: 550,
    mediaType: .movie,
    rating: 8.5,
    comment: "Amazing movie!"
)

// Get average rating
let avgRating = try await reviewService.getAverageRating(for: 550, mediaType: .movie)
```

### Watchlist
```swift
let watchlistService = WatchlistService()

// Get user's watchlist
let items = try await watchlistService.getWatchlist(for: userId)

// Toggle watchlist status
let added = try await watchlistService.toggleWatchlist(
    userId: userId,
    mediaId: 550,
    mediaType: .movie
)
```

---

## Troubleshooting

### Connection Issues
- ✅ Verify Project URL and anon key are correct
- ✅ Check that project is fully initialized (green status)
- ✅ Ensure Swift package was added correctly

### Authentication Issues
- ✅ Check email provider is enabled
- ✅ Verify RLS policies are set up correctly
- ✅ Look at Auth logs in Supabase dashboard

### Database Issues
- ✅ Verify all SQL scripts executed successfully
- ✅ Check Table Editor to see if tables were created
- ✅ Review RLS policies in table settings
- ✅ Check API logs for specific error messages

---

## Next Steps

### Backend Setup
1. ✅ Set up Supabase project
2. ✅ Configure database schema
3. ✅ Install Supabase Swift client
4. ✅ Update Supabase configuration with credentials
5. ✅ Set up TMDB API account (see `TMDB_SETUP.md`)
6. ✅ Add TMDB API key to configuration
7. ✅ Test both APIs

### App Integration
8. ⬜ Integrate authentication into login/signup screens
9. ⬜ Connect home screen to TMDB trending/popular content
10. ⬜ Implement search with TMDB API
11. ⬜ Connect detail views to combined TMDB + Supabase data
12. ⬜ Add review submission functionality
13. ⬜ Add watchlist functionality
14. ⬜ Test end-to-end user flow

---

## Complete Integration Example

Here's how all the services work together:

```swift
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var trendingMovies: [Media] = []
    @Published var popularShows: [Media] = []
    @Published var isLoading = false
    
    private let mediaService = MediaService()
    private let authService = AuthService()
    
    func loadContent() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            // Get current user ID if logged in
            let userId = authService.currentUser?.id
            
            // Fetch data with user-specific enrichment
            async let movies = mediaService.getTrendingMovies(userId: userId)
            async let shows = mediaService.getPopularTVShows(userId: userId)
            
            (trendingMovies, popularShows) = try await (movies, shows)
            
        } catch {
            print("Error loading content: \(error)")
        }
    }
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Trending Movies
                VStack(alignment: .leading) {
                    Text("Trending Movies")
                        .font(.title2)
                        .bold()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.trendingMovies) { movie in
                                MovieCard(media: movie)
                            }
                        }
                    }
                }
                
                // Popular Shows
                VStack(alignment: .leading) {
                    Text("Popular TV Shows")
                        .font(.title2)
                        .bold()
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.popularShows) { show in
                                MovieCard(media: show)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            await viewModel.loadContent()
        }
    }
}
```

---

## Resources

### Supabase
- [Supabase Documentation](https://supabase.com/docs)
- [Supabase Swift Client](https://github.com/supabase/supabase-swift)
- [Row Level Security Guide](https://supabase.com/docs/guides/auth/row-level-security)

### TMDB
- [TMDB API Documentation](https://developers.themoviedb.org/3)
- [TMDB Setup Guide](./TMDB_SETUP.md) - Complete TMDB integration guide
- [TMDB API Settings](https://www.themoviedb.org/settings/api)

---

## Support

If you run into issues:
1. Check Supabase dashboard logs (API, Database, Auth)
2. Review the SQL Editor history for executed queries
3. Test API calls using Supabase's API documentation page
4. Check Xcode console for detailed error messages
