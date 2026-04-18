// How to use this component:
// Ensure TrendingMovieCard.swift is in your project.
// MovieHeroView(movie: trendingMovie)
//    .frame(height: 500) // Defining the height for the preview layout


import SwiftUI

struct MovieHeroView: View {
    let movie: Media?
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 1. Background Image
            if let movie = movie,
               let backdropPath = movie.backdropPath,
               !backdropPath.isEmpty,
               let url = URL(string: "https://image.tmdb.org/t/p/original\(backdropPath)") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        AppColors.surfaceContainer
                            .overlay {
                                ProgressView()
                                    .tint(AppColors.primary)
                            }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        // Fallback to poster if backdrop fails
                        if let posterPath = movie.posterPath,
                           !posterPath.isEmpty,
                           let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                            AsyncImage(url: posterURL) { posterPhase in
                                switch posterPhase {
                                case .success(let posterImage):
                                    posterImage
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                default:
                                    fallbackView
                                }
                            }
                        } else {
                            fallbackView
                        }
                    @unknown default:
                        AppColors.surfaceContainer
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            } else {
                fallbackView
            }

            // 2. Gradient Overlay for Text Readability
            LinearGradient(
                gradient: Gradient(colors: [.clear, AppColors.surface.opacity(0.7), AppColors.surface]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // 3. Content Layer
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                
                // Trending Tag (Using Glass Style)
                HStack(spacing: AppSpacing.sm) {
                    Text("TRENDING MOVIES")
                        .font(AppFonts.label)
                        .foregroundColor(.white)
                    Circle()
                        .fill(AppColors.primary) // Accent dot
                        .frame(width: 6, height: 6)
                }
                .padding(.horizontal, AppSpacing.md)
                .padding(.vertical, AppSpacing.sm)
                .background(.ultraThinMaterial)
                .cornerRadius(AppRadius.full)
                
                Spacer()

                // Movie Title
                Text(movie?.title.uppercased() ?? "LOADING...")
                    .displayLarge() // Uses Inter 40pt
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                
                // Rating and Year
                if let movie = movie {
                    HStack(spacing: AppSpacing.md) {
                        // Star rating
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 16))
                            Text(String(format: "%.1f", movie.voteAverage ?? 0))
                                .font(AppFonts.body)
                                .foregroundColor(.white)
                        }
                        
                        // Release year
                        if !movie.releaseDate.isEmpty {
                            Text("•")
                                .foregroundColor(.white.opacity(0.6))
                            Text(movie.releaseDate)
                                .font(AppFonts.body)
                                .foregroundColor(.white.opacity(0.9))
                        }
                    }
                }
                
                // Action Button
                if let movie = movie {
                    NavigationLink(destination: MediaDetailScreen(media: movie)) {
                        Text("SEE DETAILS")
                            .frame(maxWidth: .infinity) // Makes it wide like the design
                    }
                    .buttonStyle(PrimaryButtonStyle()) // Uses your gradient style
                } else {
                    Button(action: {}) {
                        Text("SEE DETAILS")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .disabled(true)
                }
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, AppSpacing.xl)
            .padding(.bottom, AppSpacing.xxl) // Extra space at bottom
        }
    }
    
    // Fallback view when no image is available
    private var fallbackView: some View {
        ZStack {
            AppColors.surfaceContainer
            Image(systemName: "film.fill")
                .font(.system(size: 80))
                .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .ignoresSafeArea()
    }
}
// MARK: - Preview
#Preview {
    MovieHeroView(movie: nil)
        .frame(height: 500)
}

