import Foundation

/// Integrated service that combines TMDB data with Supabase user data
/// Provides a unified interface for fetching media content with community ratings and user-specific data
@MainActor
final class MediaService: ObservableObject {
    
    // MARK: - Dependencies
    private let tmdb = TMDBService.shared
    private let reviewService = ReviewService()
    private let watchlistService = WatchlistService()
    
    // MARK: - Published State
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Fetch Methods with User Data
    
    /// Get trending movies with user data enriched
    func getTrendingMovies(userId: UUID? = nil) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbMovies = try await tmdb.getTrendingMovies()
        return try await enrichMovies(tmdbMovies, userId: userId)
    }
    
    /// Get popular movies with user data enriched
    func getPopularMovies(userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbMovies = try await tmdb.getPopularMovies(page: page)
        return try await enrichMovies(tmdbMovies, userId: userId)
    }
    
    /// Get top rated movies with user data enriched
    func getTopRatedMovies(userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbMovies = try await tmdb.getTopRatedMovies(page: page)
        return try await enrichMovies(tmdbMovies, userId: userId)
    }
    
    /// Get now playing movies with user data enriched
    func getNowPlayingMovies(userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbMovies = try await tmdb.getNowPlayingMovies(page: page)
        return try await enrichMovies(tmdbMovies, userId: userId)
    }
    
    /// Get trending TV shows with user data enriched
    func getTrendingTVShows(userId: UUID? = nil) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbShows = try await tmdb.getTrendingTVShows()
        return try await enrichTVShows(tmdbShows, userId: userId)
    }
    
    /// Get popular TV shows with user data enriched
    func getPopularTVShows(userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbShows = try await tmdb.getPopularTVShows(page: page)
        return try await enrichTVShows(tmdbShows, userId: userId)
    }
    
    /// Get top rated TV shows with user data enriched
    func getTopRatedTVShows(userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbShows = try await tmdb.getTopRatedTVShows(page: page)
        return try await enrichTVShows(tmdbShows, userId: userId)
    }
    
    // MARK: - Detail Views
    
    /// Get full movie details with credits, videos, and user data
    func getMovieDetails(id: Int, userId: UUID? = nil) async throws -> Media {
        isLoading = true
        defer { isLoading = false }
        
        async let movie = tmdb.getMovieDetails(id: id)
        async let credits = tmdb.getMovieCredits(id: id)
        async let videos = tmdb.getMovieVideos(id: id)
        
        let (tmdbMovie, movieCredits, movieVideos) = try await (movie, credits, videos)
        
        var media = tmdbMovie.toMedia(credits: movieCredits, videos: movieVideos)
        media = try await enrichMedia(media, userId: userId)
        
        return media
    }
    
    /// Get full TV show details with credits, videos, and user data
    func getTVShowDetails(id: Int, userId: UUID? = nil) async throws -> Media {
        isLoading = true
        defer { isLoading = false }
        
        async let show = tmdb.getTVShowDetails(id: id)
        async let credits = tmdb.getTVShowCredits(id: id)
        async let videos = tmdb.getTVShowVideos(id: id)
        
        let (tmdbShow, showCredits, showVideos) = try await (show, credits, videos)
        
        var media = tmdbShow.toMedia(credits: showCredits, videos: showVideos)
        media = try await enrichMedia(media, userId: userId)
        
        return media
    }
    
    // MARK: - Search
    
    /// Search for movies with user data enriched
    func searchMovies(query: String, userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbMovies = try await tmdb.searchMovies(query: query, page: page)
        return try await enrichMovies(tmdbMovies, userId: userId)
    }
    
    /// Search for TV shows with user data enriched
    func searchTVShows(query: String, userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let tmdbShows = try await tmdb.searchTVShows(query: query, page: page)
        return try await enrichTVShows(tmdbShows, userId: userId)
    }
    
    /// Multi-search with user data enriched
    func multiSearch(query: String, userId: UUID? = nil, page: Int = 1) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let results = try await tmdb.multiSearch(query: query, page: page)
        var mediaItems: [Media] = []
        
        for result in results {
            if result.mediaType == "movie" {
                // Convert to TMDBMovie
                let movie = TMDBMovie(
                    id: result.id,
                    title: result.title ?? "",
                    originalTitle: nil,
                    overview: result.overview,
                    posterPath: result.posterPath,
                    backdropPath: result.backdropPath,
                    releaseDate: result.releaseDate,
                    voteAverage: result.voteAverage,
                    voteCount: result.voteCount,
                    popularity: result.popularity,
                    adult: nil,
                    genreIds: result.genreIds,
                    originalLanguage: nil,
                    video: nil,
                    runtime: nil,
                    genres: nil,
                    productionCompanies: nil,
                    budget: nil,
                    revenue: nil,
                    status: nil,
                    tagline: nil,
                    homepage: nil,
                    imdbId: nil
                )
                var media = movie.toMedia()
                media = try await enrichMedia(media, userId: userId)
                mediaItems.append(media)
                
            } else if result.mediaType == "tv" {
                // Convert to TMDBTVShow
                let show = TMDBTVShow(
                    id: result.id,
                    name: result.name ?? "",
                    originalName: nil,
                    overview: result.overview,
                    posterPath: result.posterPath,
                    backdropPath: result.backdropPath,
                    firstAirDate: result.firstAirDate,
                    voteAverage: result.voteAverage,
                    voteCount: result.voteCount,
                    popularity: result.popularity,
                    genreIds: result.genreIds,
                    originalLanguage: nil,
                    originCountry: nil,
                    genres: nil,
                    numberOfSeasons: nil,
                    numberOfEpisodes: nil,
                    episodeRunTime: nil,
                    status: nil,
                    type: nil,
                    tagline: nil,
                    homepage: nil,
                    inProduction: nil,
                    lastAirDate: nil,
                    createdBy: nil,
                    networks: nil,
                    productionCompanies: nil
                )
                var media = show.toMedia()
                media = try await enrichMedia(media, userId: userId)
                mediaItems.append(media)
            }
        }
        
        return mediaItems
    }
    
    // MARK: - User's Watchlist
    
    /// Get user's watchlist with full TMDB details
    func getUserWatchlist(userId: UUID) async throws -> [Media] {
        isLoading = true
        defer { isLoading = false }
        
        let watchlistItems = try await watchlistService.getWatchlist(for: userId)
        var mediaItems: [Media] = []
        
        for item in watchlistItems {
            do {
                let media: Media
                if item.mediaType == .movie {
                    media = try await getMovieDetails(id: item.mediaId, userId: userId)
                } else {
                    media = try await getTVShowDetails(id: item.mediaId, userId: userId)
                }
                mediaItems.append(media)
            } catch {
                // Continue even if one item fails
                print("⚠️ Failed to fetch watchlist item \(item.mediaId): \(error)")
            }
        }
        
        return mediaItems
    }
    
    // MARK: - Private Enrichment Methods
    
    /// Enrich a single media item with Supabase data
    private func enrichMedia(_ media: Media, userId: UUID?) async throws -> Media {
        guard let userId = userId else {
            // If no user, just get community rating
            let avgRating = try await reviewService.getAverageRating(
                for: Int(media.id) ?? 0,
                mediaType: media.type == .movie ? .movie : .tv
            )
            
            var enriched = media
            enriched.averageRating = avgRating.averageRating / 2 // Convert from 10-scale to 5-scale
            enriched.totalRatings = Int(avgRating.totalReviews)
            return enriched
        }
        
        let mediaId = Int(media.id) ?? 0
        let mediaType: MediaType = media.type == .movie ? .movie : .tv
        
        // Fetch community rating, user review, and watchlist status in parallel
        async let avgRating = reviewService.getAverageRating(for: mediaId, mediaType: mediaType)
        async let userReview = try? reviewService.getUserReview(userId: userId, mediaId: mediaId, mediaType: mediaType)
        async let inWatchlist = try? watchlistService.isInWatchlist(userId: userId, mediaId: mediaId, mediaType: mediaType)
        
        let (communityRating, review, watchlist) = await (try avgRating, userReview, inWatchlist)
        
        var enriched = media
        enriched.averageRating = communityRating.averageRating / 2 // Convert from 10-scale to 5-scale
        enriched.totalRatings = Int(communityRating.totalReviews)
        enriched.userRating = review?.rating
        enriched.isInWatchlist = watchlist ?? false
        
        return enriched
    }
    
    /// Enrich multiple movies with Supabase data
    private func enrichMovies(_ movies: [TMDBMovie], userId: UUID?) async throws -> [Media] {
        var mediaItems: [Media] = []
        
        for movie in movies {
            var media = movie.toMedia()
            media = try await enrichMedia(media, userId: userId)
            mediaItems.append(media)
        }
        
        return mediaItems
    }
    
    /// Enrich multiple TV shows with Supabase data
    private func enrichTVShows(_ shows: [TMDBTVShow], userId: UUID?) async throws -> [Media] {
        var mediaItems: [Media] = []
        
        for show in shows {
            var media = show.toMedia()
            media = try await enrichMedia(media, userId: userId)
            mediaItems.append(media)
        }
        
        return mediaItems
    }
    
    // MARK: - Convenience Methods
    
    /// Toggle watchlist status for a media item
    func toggleWatchlist(mediaId: Int, mediaType: MediaType, userId: UUID) async throws -> Bool {
        return try await watchlistService.toggleWatchlist(
            userId: userId,
            mediaId: mediaId,
            mediaType: mediaType
        )
    }
    
    /// Submit a review for a media item
    func submitReview(
        mediaId: Int,
        mediaType: MediaType,
        userId: UUID,
        rating: Double,
        comment: String?
    ) async throws -> Review {
        return try await reviewService.submitReview(
            userId: userId,
            mediaId: mediaId,
            mediaType: mediaType,
            rating: rating,
            comment: comment
        )
    }
    
    /// Get all reviews for a media item
    func getReviews(for mediaId: Int, mediaType: MediaType) async throws -> [Review] {
        return try await reviewService.getReviews(for: mediaId, mediaType: mediaType)
    }
    
    // MARK: - Error Handling
    
    func handleError(_ error: Error) {
        errorMessage = error.localizedDescription
        #if DEBUG
        print("❌ MediaService Error: \(error)")
        #endif
    }
}

// MARK: - MediaType Extension

extension MediaType {
    /// Convert from SupabaseConfig MediaType to MediaModels MediaType
    var toAppMediaType: MediaModels.MediaType {
        switch self {
        case .movie:
            return .movie
        case .tv:
            return .tvShow
        }
    }
}

extension MediaModels.MediaType {
    /// Convert from MediaModels MediaType to SupabaseConfig MediaType
    var toSupabaseMediaType: SupabaseConfig.MediaType {
        switch self {
        case .movie:
            return .movie
        case .tvShow:
            return .tv
        }
    }
}
