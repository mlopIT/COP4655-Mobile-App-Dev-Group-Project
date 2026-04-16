import Foundation
import Supabase

/// Configuration and client for Supabase backend services
/// 
/// **Setup Instructions:**
/// 1. Add Supabase Swift package to your project:
///    - File → Add Package Dependencies
///    - URL: https://github.com/supabase/supabase-swift
///    - Products: Supabase, Auth, PostgREST
///
/// 2. Configure Secrets.xcconfig with your credentials (already done ✅)
///
/// 3. Add to Info.plist:
///    - Key: SUPABASE_URL, Value: $(SUPABASE_URL)
///    - Key: SUPABASE_ANON_KEY, Value: $(SUPABASE_ANON_KEY)
///
/// 4. Ensure Secrets.xcconfig is set as configuration file:
///    - Select project in Xcode
///    - Select target
///    - Info tab → Configurations
///    - Set Secrets for Debug/Release
final class SupabaseConfig {
    
    // MARK: - Singleton
    static let shared = SupabaseConfig()
    
    // MARK: - Supabase Client
    let client: SupabaseClient
    
    // MARK: - Configuration
    private let supabaseURL: String
    private let supabaseAnonKey: String
    
    private init() {
        // Read configuration from Info.plist (which gets values from Secrets.xcconfig)
        guard let url = Bundle.main.infoDictionary?["SUPABASE_URL"] as? String,
              let key = Bundle.main.infoDictionary?["SUPABASE_ANON_KEY"] as? String,
              !url.isEmpty,
              !key.isEmpty else {
            fatalError("⚠️ Supabase configuration missing! Make sure SUPABASE_URL and SUPABASE_ANON_KEY are set in Info.plist and Secrets.xcconfig")
        }
        
        self.supabaseURL = url
        self.supabaseAnonKey = key
        
        // Initialize Supabase client
        guard let validURL = URL(string: supabaseURL) else {
            fatalError("⚠️ Invalid SUPABASE_URL: \(supabaseURL)")
        }
        
        self.client = SupabaseClient(
            supabaseURL: validURL,
            supabaseKey: supabaseAnonKey
        )
        
        #if DEBUG
        print("✅ Supabase configured with URL: \(supabaseURL)")
        #endif
    }
}

// MARK: - Models for Database

/// User profile model (syncs with profiles table)
struct Profile: Codable, Identifiable {
    let id: UUID
    let email: String
    var username: String?
    var avatarUrl: String?
    let createdAt: Date
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case avatarUrl = "avatar_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

/// Review model (syncs with reviews table)
struct Review: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let mediaId: Int
    let mediaType: MediaType
    let rating: Double
    let comment: String?
    let createdAt: Date
    let updatedAt: Date
    
    // Optional: user profile for display
    var profile: Profile?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case mediaId = "media_id"
        case mediaType = "media_type"
        case rating
        case comment
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case profile
    }
}

/// Media type enum
enum MediaType: String, Codable {
    case movie
    case tv
}

/// Watchlist item model
struct WatchlistItem: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let mediaId: Int
    let mediaType: MediaType
    let addedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case mediaId = "media_id"
        case mediaType = "media_type"
        case addedAt = "added_at"
    }
}

/// Response from get_average_rating function
struct AverageRating: Codable {
    let averageRating: Double
    let totalReviews: Int
    
    enum CodingKeys: String, CodingKey {
        case averageRating = "average_rating"
        case totalReviews = "total_reviews"
    }
}
