import Foundation
import Supabase

/// Service for handling watchlist operations
final class WatchlistService {
    
    private let client = SupabaseConfig.shared.client
    
    // MARK: - Fetch Watchlist
    
    /// Get all watchlist items for a user
    func getWatchlist(for userId: UUID) async throws -> [WatchlistItem] {
        let response: [WatchlistItem] = try await client.database
            .from("watchlist")
            .select()
            .eq("user_id", value: userId)
            .order("added_at", ascending: false)
            .execute()
            .value
        
        return response
    }
    
    /// Check if a media item is in user's watchlist
    func isInWatchlist(userId: UUID, mediaId: Int, mediaType: MediaType) async throws -> Bool {
        let response: [WatchlistItem] = try await client.database
            .from("watchlist")
            .select()
            .eq("user_id", value: userId)
            .eq("media_id", value: mediaId)
            .eq("media_type", value: mediaType.rawValue)
            .execute()
            .value
        
        return !response.isEmpty
    }
    
    // MARK: - Add to Watchlist
    
    /// Add a media item to user's watchlist
    func addToWatchlist(
        userId: UUID,
        mediaId: Int,
        mediaType: MediaType
    ) async throws -> WatchlistItem {
        let watchlistData: [String: Any] = [
            "user_id": userId.uuidString,
            "media_id": mediaId,
            "media_type": mediaType.rawValue
        ]
        
        let response: WatchlistItem = try await client.database
            .from("watchlist")
            .insert(watchlistData)
            .select()
            .single()
            .execute()
            .value
        
        return response
    }
    
    // MARK: - Remove from Watchlist
    
    /// Remove a media item from user's watchlist
    func removeFromWatchlist(
        userId: UUID,
        mediaId: Int,
        mediaType: MediaType
    ) async throws {
        try await client.database
            .from("watchlist")
            .delete()
            .eq("user_id", value: userId)
            .eq("media_id", value: mediaId)
            .eq("media_type", value: mediaType.rawValue)
            .execute()
    }
    
    /// Toggle watchlist status (add if not present, remove if present)
    func toggleWatchlist(
        userId: UUID,
        mediaId: Int,
        mediaType: MediaType
    ) async throws -> Bool {
        let isInList = try await isInWatchlist(
            userId: userId,
            mediaId: mediaId,
            mediaType: mediaType
        )
        
        if isInList {
            try await removeFromWatchlist(
                userId: userId,
                mediaId: mediaId,
                mediaType: mediaType
            )
            return false
        } else {
            _ = try await addToWatchlist(
                userId: userId,
                mediaId: mediaId,
                mediaType: mediaType
            )
            return true
        }
    }
}
