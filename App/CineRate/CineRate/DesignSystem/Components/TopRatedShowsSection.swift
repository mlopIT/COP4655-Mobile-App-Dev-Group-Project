import SwiftUI

struct TopRatedSection: View {
    let tvShows: [Media]
    let isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Header Row
            HStack(alignment: .firstTextBaseline) {
                Text("TRENDING TV SHOWS")
                    .headline() // Applies Inter 24pt, Bold, and White
                
                Spacer()
                
                Button(action: {
                    print("View All TV Shows Tapped")
                    // TODO: Navigate to TV shows list
                }) {
                    Text("VIEW ALL")
                        .font(AppFonts.label)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            // Horizontal Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppSpacing.md) {
                    if isLoading {
                        // Loading placeholders
                        ForEach(0..<3, id: \.self) { _ in
                            TrendingCardSkeleton()
                        }
                    } else if tvShows.isEmpty {
                        // Empty state
                        Text("No TV shows available")
                            .font(AppFonts.body)
                            .foregroundColor(AppColors.onSurfaceVariant)
                            .frame(maxWidth: .infinity)
                            .padding()
                    } else {
                        // Real data
                        ForEach(tvShows.prefix(10)) { show in
                            TrendingCard(media: show)
                        }
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.bottom, AppSpacing.lg) // Space for the shadow
            }
        }
    }
}
// MARK: - Trending Card with Real Data

struct TrendingCard: View {
    let media: Media
    
    var body: some View {
        NavigationLink(destination: MediaDetailScreen(media: media)) {
            VStack(alignment: .leading, spacing: 0) {
                
                // Poster Image
                if let posterPath = media.posterPath,
                   let url = URL(string: "https://image.tmdb.org/t/p/w342\(posterPath)") {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            Rectangle()
                                .fill(AppColors.surfaceContainer)
                                .frame(width: 160, height: 240)
                                .overlay {
                                    ProgressView()
                                        .tint(AppColors.primary)
                                }
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 240)
                                .clipped()
                        case .failure:
                            posterPlaceholder
                        @unknown default:
                            posterPlaceholder
                        }
                    }
                } else {
                    posterPlaceholder
                }
                
                // Info Section
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    // Title
                    Text(media.title)
                        .font(AppFonts.body)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                        .lineLimit(1)
                    
                    // Genres (using first 2)
                    if !media.genres.isEmpty {
                        Text(media.genres.prefix(2).joined(separator: " / "))
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                            .lineLimit(1)
                    } else {
                        Text(media.type == .movie ? "Movie" : "TV Show")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                    
                    // Rating
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                        
                        if let rating = media.voteAverage {
                            Text(String(format: "%.1f", rating))
                                .font(AppFonts.bodySmall)
                                .fontWeight(.semibold)
                                .foregroundColor(AppColors.onSurface)
                        } else {
                            Text("N/A")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                        }
                    }
                }
                .padding(AppSpacing.md)
                .frame(width: 160)
                .background(AppColors.surfaceContainer)
            }
            .cornerRadius(AppRadius.md)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var posterPlaceholder: some View {
        Rectangle()
            .fill(AppColors.surfaceContainer)
            .frame(width: 160, height: 240)
            .overlay {
                Image(systemName: "tv.fill")
                    .font(.system(size: 40))
                    .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            }
    }
}

// MARK: - Loading Skeleton

struct TrendingCardSkeleton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .fill(AppColors.surfaceContainer)
                .frame(width: 160, height: 240)
                .shimmer()
            
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Rectangle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 120, height: 16)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 80, height: 12)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 60, height: 12)
                    .cornerRadius(4)
            }
            .padding(AppSpacing.md)
            .frame(width: 160)
        }
        .cornerRadius(AppRadius.md)
    }
}

// MARK: - Shimmer Effect

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    colors: [
                        .clear,
                        .white.opacity(0.3),
                        .clear
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: phase)
                .mask(content)
            }
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 300
                }
            }
    }
}

// MARK: - Preview
#Preview("Trending Section - Loading") {
    TopRatedSection(tvShows: [], isLoading: true)
        .background(AppColors.surface)
}

#Preview("Trending Section - With Data") {
    TopRatedSection(tvShows: [], isLoading: false) // Pass actual Media array
        .background(AppColors.surface)
}

