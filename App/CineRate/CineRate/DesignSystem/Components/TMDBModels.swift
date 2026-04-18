import Foundation

// MARK: - TMDB Response Models

/// Response wrapper for paginated TMDB results
struct TMDBResponse<T: Codable>: Codable {
    let page: Int
    let results: [T]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie Models

/// Movie model from TMDB API
struct TMDBMovie: Codable, Identifiable {
    let id: Int
    let title: String
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    let popularity: Double?
    let adult: Bool?
    let genreIds: [Int]?
    let originalLanguage: String?
    let video: Bool?
    
    // Detailed movie info (from movie details endpoint)
    let runtime: Int?
    let genres: [TMDBGenre]?
    let productionCompanies: [TMDBProductionCompany]?
    let budget: Int?
    let revenue: Int?
    let status: String?
    let tagline: String?
    let homepage: String?
    let imdbId: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity, adult, video, runtime, genres, budget, revenue, status, tagline, homepage
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case productionCompanies = "production_companies"
        case imdbId = "imdb_id"
    }
}

// MARK: - TV Show Models

/// TV Show model from TMDB API
struct TMDBTVShow: Codable, Identifiable {
    let id: Int
    let name: String
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let firstAirDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    let popularity: Double?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originCountry: [String]?
    
    // Detailed TV info (from TV details endpoint)
    let genres: [TMDBGenre]?
    let numberOfSeasons: Int?
    let numberOfEpisodes: Int?
    let episodeRunTime: [Int]?
    let status: String?
    let type: String?
    let tagline: String?
    let homepage: String?
    let inProduction: Bool?
    let lastAirDate: String?
    let createdBy: [TMDBCreator]?
    let networks: [TMDBNetwork]?
    let productionCompanies: [TMDBProductionCompany]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview, popularity, genres, status, type, tagline, homepage
        case originalName = "original_name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originCountry = "origin_country"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
        case episodeRunTime = "episode_run_time"
        case inProduction = "in_production"
        case lastAirDate = "last_air_date"
        case createdBy = "created_by"
        case networks
        case productionCompanies = "production_companies"
    }
}

// MARK: - Supporting Models

/// Genre information
struct TMDBGenre: Codable, Identifiable {
    let id: Int
    let name: String
}

/// Production company information
struct TMDBProductionCompany: Codable, Identifiable {
    let id: Int
    let name: String
    let logoPath: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

/// TV show creator information
struct TMDBCreator: Codable, Identifiable {
    let id: Int
    let name: String
    let creditId: String?
    let gender: Int?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender
        case creditId = "credit_id"
        case profilePath = "profile_path"
    }
}

/// Network information
struct TMDBNetwork: Codable, Identifiable {
    let id: Int
    let name: String
    let logoPath: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

// MARK: - Credits Models

/// Credits response (cast and crew)
struct TMDBCredits: Codable {
    let id: Int
    let cast: [TMDBCastMember]
    let crew: [TMDBCrewMember]
}

/// Cast member information
struct TMDBCastMember: Codable, Identifiable {
    let id: Int
    let name: String
    let character: String
    let profilePath: String?
    let order: Int
    let gender: Int?
    let knownForDepartment: String?
    let castId: Int?
    let creditId: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, character, order, gender
        case profilePath = "profile_path"
        case knownForDepartment = "known_for_department"
        case castId = "cast_id"
        case creditId = "credit_id"
    }
}

/// Crew member information
struct TMDBCrewMember: Codable, Identifiable {
    let id: Int
    let name: String
    let job: String
    let department: String
    let profilePath: String?
    let gender: Int?
    let creditId: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, job, department, gender
        case profilePath = "profile_path"
        case creditId = "credit_id"
    }
}

// MARK: - Videos Models

/// Videos response (trailers, teasers, etc.)
struct TMDBVideosResponse: Codable {
    let id: Int
    let results: [TMDBVideo]
}

/// Video information
struct TMDBVideo: Codable, Identifiable {
    let id: String
    let key: String
    let name: String
    let site: String // e.g., "YouTube"
    let size: Int
    let type: String // e.g., "Trailer", "Teaser"
    let official: Bool?
    let publishedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, key, name, site, size, type, official
        case publishedAt = "published_at"
    }
    
    /// Get YouTube URL for this video
    var youtubeURL: URL? {
        guard site == "YouTube" else { return nil }
        return URL(string: "https://www.youtube.com/watch?v=\(key)")
    }
}

// MARK: - Search Results

/// Multi-search result (can be movie, TV show, or person)
struct TMDBMultiSearchResult: Codable, Identifiable {
    let id: Int
    let mediaType: String
    
    // Movie fields
    let title: String?
    let releaseDate: String?
    
    // TV fields
    let name: String?
    let firstAirDate: String?
    
    // Common fields
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let popularity: Double?
    let genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, name, overview, popularity
        case mediaType = "media_type"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
    }
}

// MARK: - Image Configuration

/// TMDB API configuration (for image URLs)
struct TMDBConfiguration: Codable {
    let images: TMDBImageConfiguration
    let changeKeys: [String]
    
    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}

struct TMDBImageConfiguration: Codable {
    let baseUrl: String
    let secureBaseUrl: String
    let backdropSizes: [String]
    let posterSizes: [String]
    let profileSizes: [String]
    let logoSizes: [String]
    let stillSizes: [String]
    
    enum CodingKeys: String, CodingKey {
        case baseUrl = "base_url"
        case secureBaseUrl = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case logoSizes = "logo_sizes"
        case stillSizes = "still_sizes"
    }
}

// MARK: - Helper Extensions

extension TMDBMovie {
    /// Convert TMDB movie to app's Media model
    func toMedia(credits: TMDBCredits? = nil, videos: TMDBVideosResponse? = nil) -> Media {
        let year = releaseDate?.prefix(4).description ?? "Unknown"
        let runtimeStr = runtime.map { "\($0 / 60)h \($0 % 60)m" }
        
        let director = credits?.crew.first(where: { $0.job == "Director" })?.name
        
        let castMembers = credits?.cast.prefix(10).map { member in
            CastMember(
                id: String(member.id),
                name: member.name,
                character: member.character,
                profileImage: TMDBService.shared.imageURL(path: member.profilePath, size: .profile)
            )
        } ?? []
        
        let trailer = videos?.results.first(where: { $0.type == "Trailer" && $0.site == "YouTube" })
        
        return Media(
            id: String(id),
            type: .movie,
            title: title,
            releaseYear: year,
            runtime: runtimeStr,
            rating: adult == true ? "R" : "PG-13", // Simplified - TMDB doesn't provide ratings
            genres: genres?.map { $0.name } ?? [],
            posterImage: TMDBService.shared.imageURL(path: posterPath, size: .poster) ?? "",
            backdropImage: TMDBService.shared.imageURL(path: backdropPath, size: .backdrop),
            overview: overview ?? "",
            director: director,
            creators: nil,
            cast: castMembers,
            averageRating: (voteAverage ?? 0) / 2, // Convert from 10-scale to 5-scale
            totalRatings: voteCount ?? 0,
            userRating: nil,
            isInWatchlist: false,
            seasonCount: nil,
            episodeCount: nil,
            status: status,
            trailerURL: trailer?.youtubeURL?.absoluteString,
            releaseDate: releaseDate ?? ""
        )
    }
}

extension TMDBTVShow {
    /// Convert TMDB TV show to app's Media model
    func toMedia(credits: TMDBCredits? = nil, videos: TMDBVideosResponse? = nil) -> Media {
        let year = firstAirDate?.prefix(4).description ?? "Unknown"
        let runtimeStr = episodeRunTime?.first.map { "\($0)m" }
        
        let creators = createdBy?.map { $0.name } ?? []
        
        let castMembers = credits?.cast.prefix(10).map { member in
            CastMember(
                id: String(member.id),
                name: member.name,
                character: member.character,
                profileImage: TMDBService.shared.imageURL(path: member.profilePath, size: .profile)
            )
        } ?? []
        
        let trailer = videos?.results.first(where: { $0.type == "Trailer" && $0.site == "YouTube" })
        
        return Media(
            id: String(id),
            type: .tvShow,
            title: name,
            releaseYear: year,
            runtime: runtimeStr,
            rating: "TV-MA", // Simplified - TMDB doesn't provide content ratings
            genres: genres?.map { $0.name } ?? [],
            posterImage: TMDBService.shared.imageURL(path: posterPath, size: .poster) ?? "",
            backdropImage: TMDBService.shared.imageURL(path: backdropPath, size: .backdrop),
            overview: overview ?? "",
            director: nil,
            creators: creators.isEmpty ? nil : creators,
            cast: castMembers,
            averageRating: (voteAverage ?? 0) / 2, // Convert from 10-scale to 5-scale
            totalRatings: voteCount ?? 0,
            userRating: nil,
            isInWatchlist: false,
            seasonCount: numberOfSeasons,
            episodeCount: numberOfEpisodes,
            status: status,
            trailerURL: trailer?.youtubeURL?.absoluteString,
            releaseDate: firstAirDate ?? ""
        )
    }
}
