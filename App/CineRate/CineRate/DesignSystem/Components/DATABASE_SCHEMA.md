# Database Schema Reference

## Entity Relationship Diagram

```
┌─────────────────┐
│  auth.users     │ (Supabase managed)
│  (Built-in)     │
└────────┬────────┘
         │
         │ 1:1
         │
┌────────▼────────┐
│   profiles      │
├─────────────────┤
│ id (PK, FK)     │
│ email           │
│ username        │
│ avatar_url      │
│ created_at      │
│ updated_at      │
└────────┬────────┘
         │
         │ 1:N
         │
    ┌────┴────┐
    │         │
┌───▼────┐ ┌──▼───────┐
│ reviews│ │watchlist │
└────────┘ └──────────┘
```

---

## Tables

### profiles
Stores extended user information beyond Supabase auth.

| Column     | Type      | Constraints              | Description                    |
|------------|-----------|--------------------------|--------------------------------|
| id         | UUID      | PK, FK → auth.users      | User ID from Supabase Auth     |
| email      | TEXT      | NOT NULL, UNIQUE         | User's email address           |
| username   | TEXT      | UNIQUE                   | Optional display name          |
| avatar_url | TEXT      |                          | URL to profile picture         |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW    | Account creation timestamp     |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT NOW    | Last profile update            |

**Indexes:**
- Primary key on `id`
- Unique index on `email`
- Unique index on `username`

**RLS Policies:**
- SELECT: Public (anyone can view profiles)
- INSERT: User can insert their own profile
- UPDATE: User can update their own profile only

---

### reviews
Stores user ratings and written reviews for movies and TV shows.

| Column     | Type          | Constraints                  | Description                        |
|------------|---------------|------------------------------|------------------------------------|
| id         | UUID          | PK, DEFAULT uuid_generate_v4 | Unique review ID                   |
| user_id    | UUID          | FK → profiles, NOT NULL      | Who wrote the review               |
| media_id   | INTEGER       | NOT NULL                     | TMDB movie/TV ID                   |
| media_type | TEXT          | CHECK ('movie' OR 'tv')      | Type of media                      |
| rating     | DECIMAL(3,1)  | CHECK (0-10), NOT NULL       | Numerical rating (0.0 - 10.0)      |
| comment    | TEXT          |                              | Optional written review            |
| created_at | TIMESTAMP     | NOT NULL, DEFAULT NOW        | When review was created            |
| updated_at | TIMESTAMP     | NOT NULL, DEFAULT NOW        | Last time review was edited        |

**Constraints:**
- UNIQUE(user_id, media_id, media_type) - One review per user per media item
- CHECK: rating must be between 0 and 10
- CHECK: media_type must be 'movie' or 'tv'

**Indexes:**
- Primary key on `id`
- Index on `user_id`
- Index on `media_id`
- Index on `media_type`

**RLS Policies:**
- SELECT: Public (anyone can read reviews)
- INSERT: User can insert their own reviews
- UPDATE: User can update their own reviews only
- DELETE: User can delete their own reviews only

---

### watchlist
Stores movies and TV shows a user wants to watch later.

| Column     | Type      | Constraints                  | Description                    |
|------------|-----------|------------------------------|--------------------------------|
| id         | UUID      | PK, DEFAULT uuid_generate_v4 | Unique watchlist entry ID      |
| user_id    | UUID      | FK → profiles, NOT NULL      | Whose watchlist this belongs to|
| media_id   | INTEGER   | NOT NULL                     | TMDB movie/TV ID               |
| media_type | TEXT      | CHECK ('movie' OR 'tv')      | Type of media                  |
| added_at   | TIMESTAMP | NOT NULL, DEFAULT NOW        | When item was added            |

**Constraints:**
- UNIQUE(user_id, media_id, media_type) - Can't add same item twice
- CHECK: media_type must be 'movie' or 'tv'

**Indexes:**
- Primary key on `id`
- Index on `user_id`

**RLS Policies:**
- SELECT: User can view their own watchlist only
- INSERT: User can add to their own watchlist
- DELETE: User can remove from their own watchlist

---

## Functions

### get_average_rating(p_media_id INTEGER, p_media_type TEXT)
Calculates the average community rating for a specific movie or TV show.

**Parameters:**
- `p_media_id`: TMDB ID of the movie or TV show
- `p_media_type`: Either 'movie' or 'tv'

**Returns:**
```sql
TABLE (
    average_rating DECIMAL,  -- Rounded to 1 decimal place
    total_reviews BIGINT     -- Count of reviews
)
```

**Usage Example:**
```sql
SELECT * FROM get_average_rating(550, 'movie');
-- Returns: { average_rating: 8.5, total_reviews: 42 }
```

---

## Triggers

### on_auth_user_created
Automatically creates a profile record when a new user signs up.

**Event:** AFTER INSERT ON auth.users  
**Function:** handle_new_user()

**Behavior:**
1. User signs up through Supabase Auth
2. Record is created in `auth.users`
3. Trigger fires automatically
4. Profile is created in `profiles` table with matching ID and email

---

## Row Level Security (RLS)

### Security Model

**profiles:**
- ✅ Anyone can view any profile (public)
- ✅ Users can only modify their own profile
- ❌ Users cannot delete profiles (handled by Supabase Auth)

**reviews:**
- ✅ Anyone can read all reviews (public ratings/reviews)
- ✅ Authenticated users can create reviews
- ✅ Users can only update/delete their own reviews
- ❌ Cannot create reviews for another user

**watchlist:**
- ✅ Users can only see their own watchlist (private)
- ✅ Users can only add to their own watchlist
- ✅ Users can only remove from their own watchlist
- ❌ Cannot view or modify other users' watchlists

### Testing RLS Policies

```sql
-- Test as anonymous user
SELECT * FROM profiles;  -- ✅ Should work
SELECT * FROM reviews;   -- ✅ Should work
SELECT * FROM watchlist; -- ❌ Should return empty

-- Test as authenticated user
INSERT INTO reviews (user_id, media_id, media_type, rating)
VALUES (auth.uid(), 550, 'movie', 8.5);  -- ✅ Should work

UPDATE reviews SET rating = 9.0
WHERE id = 'some-other-users-review-id';  -- ❌ Should fail
```

---

## Data Types

### MediaType Enum
Valid values for `media_type` columns:
- `'movie'` - Feature films, documentaries, etc.
- `'tv'` - TV series, miniseries, etc.

### Rating Scale
- **Type:** DECIMAL(3,1)
- **Range:** 0.0 to 10.0
- **Examples:** 0.0, 5.5, 8.3, 10.0

### Timestamps
- **Type:** TIMESTAMP WITH TIME ZONE
- **Format:** ISO 8601 (e.g., "2026-04-16T14:30:00Z")
- **Timezone:** Always stored in UTC

---

## Common Queries

### Get all reviews for a movie
```sql
SELECT r.*, p.username, p.avatar_url
FROM reviews r
JOIN profiles p ON r.user_id = p.id
WHERE r.media_id = 550 
  AND r.media_type = 'movie'
ORDER BY r.created_at DESC;
```

### Get user's review for a specific movie
```sql
SELECT *
FROM reviews
WHERE user_id = 'user-uuid'
  AND media_id = 550
  AND media_type = 'movie';
```

### Get average rating
```sql
SELECT * FROM get_average_rating(550, 'movie');
```

### Get user's watchlist with counts
```sql
SELECT 
    user_id,
    COUNT(*) as total_items,
    COUNT(*) FILTER (WHERE media_type = 'movie') as movies,
    COUNT(*) FILTER (WHERE media_type = 'tv') as tv_shows
FROM watchlist
WHERE user_id = 'user-uuid'
GROUP BY user_id;
```

### Get most reviewed movies
```sql
SELECT 
    media_id,
    COUNT(*) as review_count,
    ROUND(AVG(rating), 1) as avg_rating
FROM reviews
WHERE media_type = 'movie'
GROUP BY media_id
ORDER BY review_count DESC
LIMIT 10;
```

### Get user's recent activity
```sql
SELECT 
    'review' as activity_type,
    media_id,
    media_type,
    created_at as activity_date
FROM reviews
WHERE user_id = 'user-uuid'

UNION ALL

SELECT 
    'watchlist' as activity_type,
    media_id,
    media_type,
    added_at as activity_date
FROM watchlist
WHERE user_id = 'user-uuid'

ORDER BY activity_date DESC
LIMIT 20;
```

---

## Migration Notes

### Future Enhancements

If you need to add features later, consider these schema additions:

**Likes/Helpful votes on reviews:**
```sql
CREATE TABLE review_likes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    review_id UUID REFERENCES reviews ON DELETE CASCADE,
    user_id UUID REFERENCES profiles ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(review_id, user_id)
);
```

**User follows:**
```sql
CREATE TABLE follows (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    follower_id UUID REFERENCES profiles ON DELETE CASCADE,
    following_id UUID REFERENCES profiles ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(follower_id, following_id),
    CHECK (follower_id != following_id)
);
```

**Genre preferences:**
```sql
CREATE TABLE genre_preferences (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES profiles ON DELETE CASCADE,
    genre_id INTEGER NOT NULL,
    preference_score DECIMAL(3,2) DEFAULT 0,
    UNIQUE(user_id, genre_id)
);
```

---

## Best Practices

1. **Always use transactions** when updating multiple related records
2. **Use the helper functions** (like `get_average_rating`) for consistency
3. **Let RLS handle security** - don't bypass it in your app code
4. **Index foreign keys** for better join performance
5. **Use UNIQUE constraints** to prevent duplicate data
6. **Store timestamps in UTC** and convert to local time in the app
7. **Validate data** both in the database (CHECK constraints) and app

---

## Performance Optimization

### Current Indexes
Already created for optimal query performance:
- `reviews_user_id_idx` - Fast user review lookups
- `reviews_media_id_idx` - Fast media review lookups
- `reviews_media_type_idx` - Fast filtering by type
- `watchlist_user_id_idx` - Fast watchlist queries

### Potential Additional Indexes
If you notice slow queries, consider adding:
```sql
-- Composite index for common query pattern
CREATE INDEX reviews_media_composite_idx 
ON reviews(media_id, media_type, created_at DESC);

-- Index for rating ranges
CREATE INDEX reviews_rating_idx ON reviews(rating);
```

---

## Monitoring

### Key Metrics to Watch

1. **Table Sizes**
```sql
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

2. **Review Stats**
```sql
SELECT 
    media_type,
    COUNT(*) as total_reviews,
    AVG(rating) as avg_rating,
    COUNT(DISTINCT user_id) as unique_reviewers
FROM reviews
GROUP BY media_type;
```

3. **User Activity**
```sql
SELECT 
    DATE(created_at) as date,
    COUNT(*) as new_reviews
FROM reviews
WHERE created_at > NOW() - INTERVAL '30 days'
GROUP BY DATE(created_at)
ORDER BY date DESC;
```
