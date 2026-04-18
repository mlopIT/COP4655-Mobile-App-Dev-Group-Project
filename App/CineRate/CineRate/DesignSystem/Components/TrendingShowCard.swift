import SwiftUI

// DEPRECATED: This component is replaced by the new TrendingCard in TopRatedShowsSection.swift
// Keeping for reference only - can be deleted

struct TrendingCardOld: View {
    let title: String
    let genres: String
    let rating: String
    let imageName: String // Placeholder for your asset name

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                // Main Image
                // Replace Color.gray with Image(imageName) when assets are ready
                Color.gray
                    .aspectRatio(0.7, contentMode: .fill)
                    .frame(width: 260, height: 350)
                    .clipped()
                
                // Rating Badge
                Text(rating)
                    .font(AppFonts.label)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(8)
                    .padding(AppSpacing.sm)
            }
            
            // Text Content Area
            VStack(alignment: .leading, spacing: 4) {
                Text(genres.uppercased())
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                
                Text(title.uppercased())
                    .font(AppFonts.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.onSurface)
                    .lineLimit(1)
            }
            .padding(AppSpacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.surfaceContainer)
        }
        .cornerRadius(AppRadius.lg)
        // Applies a subtle outer shadow to match the reference image
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}
