import Foundation
import Supabase

/// Service for handling review and rating operations
final class ReviewService {
    
    private let client = SupabaseConfig.shared.client
    
    // MARK: - Fetch Reviews
    
    /// Get all reviews for a specific media item
    func getReviews(for mediaId: Int, mediaType: MediaType) async throws -> [Review] {
        let response: [Review] = try await client.database
            .from("reviews")
            .select("*, profile:profiles(*)")
            .eq("media_id", value: mediaId)
            .eq("media_type", value: mediaType.rawValue)
            .order("created_at", ascending: false)
            .execute()
            .value
        
        return response
    }
    
    /// Get a specific user's review for a media item
    func getUserReview(userId: UUID, mediaId: Int, mediaType: MediaType) async throws -> Review? {
        let response: [Review] = try await client.database
            .from("reviews")
            .select()
            .eq("user_id", value: userId)
            .eq("media_id", value: mediaId)
            .eq("media_type", value: mediaType.rawValue)
            .execute()
            .value
        
        return response.first
    }
    
    // MARK: - Average Rating
    
    /// Get average rating and total review count for a media item
    func getAverageRating(for mediaId: Int, mediaType: MediaType) async throws -> AverageRating {
        let response: [AverageRating] = try await client.database
            .rpc("get_average_rating", params: [
                "p_media_id": mediaId,
                "p_media_type": mediaType.rawValue
            ])
            .execute()
            .value
        
        return response.first ?? AverageRating(averageRating: 0, totalReviews: 0)
    }
    
    // MARK: - Submit Review
    
    /// Submit a new review or update existing one
    func submitReview(
        userId: UUID,
        mediaId: Int,
        mediaType: MediaType,
        rating: Double,
        comment: String?
    ) async throws -> Review {
        // Check if user already has a review for this media
        if let existingReview = try await getUserReview(
            userId: userId,
            mediaId: mediaId,
            mediaType: mediaType
        ) {
            // Update existing review
            return try await updateReview(
                reviewId: existingReview.id,
                rating: rating,
                comment: comment
            )
        } else {
            // Create new review
            let reviewData: [String: Any] = [
                "user_id": userId.uuidString,
                "media_id": mediaId,
                "media_type": mediaType.rawValue,
                "rating": rating,
                "comment": comment as Any
            ]
            
            let response: Review = try await client.database
                .from("reviews")
                .insert(reviewData)
                .select()
                .single()
                .execute()
                .value
            
            return response
        }
    }
    
    // MARK: - Update Review
    
    /// Update an existing review
    func updateReview(
        reviewId: UUID,
        rating: Double,
        comment: String?
    ) async throws -> Review {
        let updateData: [String: Any] = [
            "rating": rating,
            "comment": comment as Any,
            "updated_at": ISO8601DateFormatter().string(from: Date())
        ]
        
        let response: Review = try await client.database
            .from("reviews")
            .update(updateData)
            .eq("id", value: reviewId)
            .select()
            .single()
            .execute()
            .value
        
        return response
    }
    
    // MARK: - Delete Review
    
    /// Delete a review
    func deleteReview(reviewId: UUID) async throws {
        try await client.database
            .from("reviews")
            .delete()
            .eq("id", value: reviewId)
            .execute()
    }
}
