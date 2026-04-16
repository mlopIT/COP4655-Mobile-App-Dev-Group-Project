import Foundation

/// Service for interacting with The Movie Database (TMDB) API
/// Provides methods to fetch movies, TV shows, search, and more
final class TMDBService {
    
    // MARK: - Singleton
    static let shared = TMDBService()
    
    // MARK: - Configuration
    private let baseURL = "https://api.themoviedb.org/3"
    private let imageBaseURL = "https://image.tmdb.org/t/p"
    private let apiKey: String
    
    // MARK: - Image Sizes
    enum ImageSize: String {
        case poster = "w500"
        case backdrop = "w1280"
        case profile = "w185"
        case posterLarge = "original"
        case backdropLarge = "original"
    }
    
    // MARK: - Initialization
    private init() {
        // Read API key from Info.plist (configured via Secrets.xcconfig)
        guard let key = Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String,
              !key.isEmpty,
              key != "YOUR_TMDB_API_KEY_HERE" else {
            fatalError("⚠️ TMDB API key missing! Add TMDB_API_KEY to Info.plist and Secrets.xcconfig")
        }
        self.apiKey = key
        
        #if DEBUG
        print("✅ TMDB API configured")
        #endif
    }
    
    // MARK: - Public Methods
    
    // MARK: Movies
    
    /// Get trending movies for today
    func getTrendingMovies() async throws -> [TMDBMovie] {
        let endpoint = "/trending/movie/day"
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint)
        return response.results
    }
    
    /// Get popular movies
    func getPopularMovies(page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/movie/popular"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get top rated movies
    func getTopRatedMovies(page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/movie/top_rated"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get now playing movies
    func getNowPlayingMovies(page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/movie/now_playing"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get upcoming movies
    func getUpcomingMovies(page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/movie/upcoming"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get movie details by ID
    func getMovieDetails(id: Int) async throws -> TMDBMovie {
        let endpoint = "/movie/\(id)"
        let params = ["append_to_response": "credits,videos"]
        return try await fetch(endpoint: endpoint, parameters: params)
    }
    
    /// Get movie credits (cast and crew)
    func getMovieCredits(id: Int) async throws -> TMDBCredits {
        let endpoint = "/movie/\(id)/credits"
        return try await fetch(endpoint: endpoint)
    }
    
    /// Get movie videos (trailers, teasers)
    func getMovieVideos(id: Int) async throws -> TMDBVideosResponse {
        let endpoint = "/movie/\(id)/videos"
        return try await fetch(endpoint: endpoint)
    }
    
    /// Get similar movies
    func getSimilarMovies(id: Int, page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/movie/\(id)/similar"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    // MARK: TV Shows
    
    /// Get trending TV shows for today
    func getTrendingTVShows() async throws -> [TMDBTVShow] {
        let endpoint = "/trending/tv/day"
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint)
        return response.results
    }
    
    /// Get popular TV shows
    func getPopularTVShows(page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/tv/popular"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get top rated TV shows
    func getTopRatedTVShows(page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/tv/top_rated"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get TV shows airing today
    func getAiringTodayTVShows(page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/tv/airing_today"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get TV shows currently on the air
    func getOnTheAirTVShows(page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/tv/on_the_air"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Get TV show details by ID
    func getTVShowDetails(id: Int) async throws -> TMDBTVShow {
        let endpoint = "/tv/\(id)"
        let params = ["append_to_response": "credits,videos"]
        return try await fetch(endpoint: endpoint, parameters: params)
    }
    
    /// Get TV show credits (cast and crew)
    func getTVShowCredits(id: Int) async throws -> TMDBCredits {
        let endpoint = "/tv/\(id)/credits"
        return try await fetch(endpoint: endpoint)
    }
    
    /// Get TV show videos (trailers, teasers)
    func getTVShowVideos(id: Int) async throws -> TMDBVideosResponse {
        let endpoint = "/tv/\(id)/videos"
        return try await fetch(endpoint: endpoint)
    }
    
    /// Get similar TV shows
    func getSimilarTVShows(id: Int, page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/tv/\(id)/similar"
        let params = ["page": "\(page)"]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    // MARK: Search
    
    /// Search for movies
    func searchMovies(query: String, page: Int = 1) async throws -> [TMDBMovie] {
        let endpoint = "/search/movie"
        let params = [
            "query": query,
            "page": "\(page)"
        ]
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Search for TV shows
    func searchTVShows(query: String, page: Int = 1) async throws -> [TMDBTVShow] {
        let endpoint = "/search/tv"
        let params = [
            "query": query,
            "page": "\(page)"
        ]
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Multi-search (movies, TV shows, and people)
    func multiSearch(query: String, page: Int = 1) async throws -> [TMDBMultiSearchResult] {
        let endpoint = "/search/multi"
        let params = [
            "query": query,
            "page": "\(page)"
        ]
        let response: TMDBResponse<TMDBMultiSearchResult> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    // MARK: Discover
    
    /// Discover movies with filters
    func discoverMovies(
        genre: Int? = nil,
        year: Int? = nil,
        sortBy: String = "popularity.desc",
        page: Int = 1
    ) async throws -> [TMDBMovie] {
        let endpoint = "/discover/movie"
        var params = [
            "sort_by": sortBy,
            "page": "\(page)"
        ]
        
        if let genre = genre {
            params["with_genres"] = "\(genre)"
        }
        if let year = year {
            params["year"] = "\(year)"
        }
        
        let response: TMDBResponse<TMDBMovie> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    /// Discover TV shows with filters
    func discoverTVShows(
        genre: Int? = nil,
        year: Int? = nil,
        sortBy: String = "popularity.desc",
        page: Int = 1
    ) async throws -> [TMDBTVShow] {
        let endpoint = "/discover/tv"
        var params = [
            "sort_by": sortBy,
            "page": "\(page)"
        ]
        
        if let genre = genre {
            params["with_genres"] = "\(genre)"
        }
        if let year = year {
            params["first_air_date_year"] = "\(year)"
        }
        
        let response: TMDBResponse<TMDBTVShow> = try await fetch(endpoint: endpoint, parameters: params)
        return response.results
    }
    
    // MARK: Genres
    
    /// Get list of movie genres
    func getMovieGenres() async throws -> [TMDBGenre] {
        let endpoint = "/genre/movie/list"
        let response: GenreListResponse = try await fetch(endpoint: endpoint)
        return response.genres
    }
    
    /// Get list of TV show genres
    func getTVGenres() async throws -> [TMDBGenre] {
        let endpoint = "/genre/tv/list"
        let response: GenreListResponse = try await fetch(endpoint: endpoint)
        return response.genres
    }
    
    // MARK: - Image URL Helper
    
    /// Get full image URL for a given path and size
    func imageURL(path: String, size: ImageSize = .poster) -> String {
        return "\(imageBaseURL)/\(size.rawValue)\(path)"
    }
    
    // MARK: - Private Network Layer
    
    private func fetch<T: Decodable>(
        endpoint: String,
        parameters: [String: String] = [:]
    ) async throws -> T {
        // Build URL
        var urlComponents = URLComponents(string: baseURL + endpoint)!
        
        // Add API key and other parameters
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw TMDBError.invalidURL
        }
        
        // Make request
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw TMDBError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw TMDBError.httpError(statusCode: httpResponse.statusCode)
        }
        
        // Decode response
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            #if DEBUG
            print("❌ TMDB Decoding Error: \(error)")
            if let json = String(data: data, encoding: .utf8) {
                print("Response JSON: \(json)")
            }
            #endif
            throw TMDBError.decodingError(error)
        }
    }
}

// MARK: - Error Types

enum TMDBError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .httpError(let statusCode):
            return "HTTP error: \(statusCode)"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}

// MARK: - Supporting Models

private struct GenreListResponse: Codable {
    let genres: [TMDBGenre]
}
