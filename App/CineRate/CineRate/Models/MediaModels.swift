// File Name: MediaModels.swift
import SwiftUI

// MARK: - Media Type
enum MediaType: String, Codable {
    case movie = "Movie"
    case tvShow = "TV Show"
}

// MARK: - Media Model
struct Media: Identifiable {
    let id: String
    let type: MediaType
    let title: String
    let releaseYear: String
    let runtime: String? // e.g., "2h 28m" for movies or "45m" for TV episodes
    let rating: String // e.g., "PG-13", "TV-MA"
    let genres: [String]
    let posterImage: String // Image name or URL
    let backdropImage: String? // Hero/banner image
    let overview: String
    let director: String? // For movies
    let creators: [String]? // For TV shows
    let cast: [CastMember]
    var averageRating: Double // 0.0 to 5.0 - mutable for enrichment
    var totalRatings: Int // mutable for enrichment
    var userRating: Double? // User's personal rating if logged in - mutable for enrichment
    var isInWatchlist: Bool // mutable for enrichment
    let seasonCount: Int? // For TV shows
    let episodeCount: Int? // For TV shows
    let status: String? // e.g., "Continuing", "Ended"
    let trailerURL: String?
    let releaseDate: String // Full date e.g., "March 15, 2024"
    
    // TMDB compatibility properties
    var posterPath: String? { posterImage.isEmpty ? nil : posterImage }
    var backdropPath: String? { backdropImage }
    var voteAverage: Double? { averageRating * 2 } // Convert from 0-5 to 0-10 scale
}

// MARK: - Cast Member
struct CastMember: Identifiable {
    let id: String
    let name: String
    let character: String
    let profileImage: String?
}

// MARK: - Sample Data
extension Media {
    static let sampleMovie = Media(
        id: "1",
        type: .movie,
        title: "Inception",
        releaseYear: "2010",
        runtime: "2h 28m",
        rating: "PG-13",
        genres: ["Action", "Sci-Fi", "Thriller"],
        posterImage: "film.fill", // Placeholder - use actual image
        backdropImage: "photo.fill",
        overview: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.",
        director: "Christopher Nolan",
        creators: nil,
        cast: [
            CastMember(id: "1", name: "Leonardo DiCaprio", character: "Cobb", profileImage: nil),
            CastMember(id: "2", name: "Joseph Gordon-Levitt", character: "Arthur", profileImage: nil),
            CastMember(id: "3", name: "Elliot Page", character: "Ariadne", profileImage: nil),
            CastMember(id: "4", name: "Tom Hardy", character: "Eames", profileImage: nil)
        ],
        averageRating: 4.5,
        totalRatings: 25840,
        userRating: nil,
        isInWatchlist: false,
        seasonCount: nil,
        episodeCount: nil,
        status: nil,
        trailerURL: "https://youtube.com/watch?v=example",
        releaseDate: "July 16, 2010"
    )
    
    static let sampleTVShow = Media(
        id: "2",
        type: .tvShow,
        title: "Breaking Bad",
        releaseYear: "2008",
        runtime: "47m",
        rating: "TV-MA",
        genres: ["Crime", "Drama", "Thriller"],
        posterImage: "tv.fill",
        backdropImage: "photo.fill",
        overview: "A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family's future.",
        director: nil,
        creators: ["Vince Gilligan"],
        cast: [
            CastMember(id: "1", name: "Bryan Cranston", character: "Walter White", profileImage: nil),
            CastMember(id: "2", name: "Aaron Paul", character: "Jesse Pinkman", profileImage: nil),
            CastMember(id: "3", name: "Anna Gunn", character: "Skyler White", profileImage: nil),
            CastMember(id: "4", name: "Dean Norris", character: "Hank Schrader", profileImage: nil)
        ],
        averageRating: 4.8,
        totalRatings: 48920,
        userRating: 5.0,
        isInWatchlist: true,
        seasonCount: 5,
        episodeCount: 62,
        status: "Ended",
        trailerURL: "https://youtube.com/watch?v=example",
        releaseDate: "January 20, 2008"
    )
}
