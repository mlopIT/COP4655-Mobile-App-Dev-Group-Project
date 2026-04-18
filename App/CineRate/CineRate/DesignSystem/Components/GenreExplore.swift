import SwiftUI

// MARK: - Data Model
struct Genre: Identifiable {
    let id: Int // TMDB genre ID
    let name: String
    let tmdbGenreId: Int
    var imageURL: String? // TMDB backdrop URL
    
    init(id: Int, name: String, tmdbGenreId: Int, imageURL: String? = nil) {
        self.id = id
        self.name = name
        self.tmdbGenreId = tmdbGenreId
        self.imageURL = imageURL
    }
}

// MARK: - Genre Row Card
struct GenreRowCard: View {
    let genre: Genre
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .leading) {
                // Background image from TMDB
                if let imageURL = genre.imageURL, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            // Loading state
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
                            // Fallback gradient
                            genreFallbackGradient
                        @unknown default:
                            genreFallbackGradient
                        }
                    }
                } else {
                    // Fallback gradient if no image
                    genreFallbackGradient
                }

                // Dark gradient overlay so text is always readable
                LinearGradient(
                    colors: [
                        Color.black.opacity(0.65),
                        Color.black.opacity(0.1)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )

                // Genre label
                Text(genre.name)
                    .font(AppFonts.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white) // Always white for readability on images
                    .tracking(1.5)
                    .padding(.leading, AppSpacing.lg)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .cornerRadius(AppRadius.full) // pill shape — matches the design
            .clipped()
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var genreFallbackGradient: some View {
        LinearGradient(
            colors: [AppColors.primary, AppColors.primaryContainer],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

// MARK: - Discover More Row
struct DiscoverMoreRow: View {
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: AppSpacing.md) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("DISCOVER MORE")
                        .font(AppFonts.title)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                        .tracking(1)

                    Text("Browse various genres")
                        .font(AppFonts.bodySmall)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }

                Spacer()

                // Arrow icon
                Image(systemName: "arrow.right")
                    .foregroundColor(AppColors.onSurface)
                    .padding(AppSpacing.md)
                    .background(AppColors.surfaceContainerHigh)
                    .clipShape(Circle())
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.vertical, AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.full) // pill shape
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Explore Genres Section
struct ExploreGenresSection: View {
    @State private var genres: [Genre] = [
        Genre(id: 53, name: "THRILLER", tmdbGenreId: 53),
        Genre(id: 878, name: "SCI-FI", tmdbGenreId: 878),
        Genre(id: 18, name: "DRAMA", tmdbGenreId: 18), // Using Drama instead of "Classic"
    ]
    
    @State private var isLoading = true

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {

            // Section header
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("WHAT ARE YOU INTO?")
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .tracking(1.5)

                Text("EXPLORE GENRES")
                    .font(AppFonts.displayLarge)
                    .fontWeight(.heavy)
                    .foregroundColor(AppColors.onSurface)
                    .tracking(1)
            }

            // Genre rows
            VStack(spacing: AppSpacing.sm) {
                ForEach(genres) { genre in
                    GenreRowCard(genre: genre) {
                        print("\(genre.name) tapped")
                        // TODO: Navigate to genre screen
                    }
                }

                DiscoverMoreRow {
                    print("Discover More tapped")
                    // TODO: Navigate to all genres screen
                }
            }
        }
        .padding(AppSpacing.lg)
        .background(AppColors.surface)
        .task {
            await loadGenreImages()
        }
    }
    
    // MARK: - Load Genre Images from TMDB
    
    private func loadGenreImages() async {
        guard isLoading else { return }
        
        do {
            // Load images for each genre in parallel
            await withTaskGroup(of: (Int, String?).self) { group in
                for genre in genres {
                    group.addTask {
                        // Get top movie from this genre
                        if let movies = try? await TMDBService.shared.discoverMovies(
                            genre: genre.tmdbGenreId,
                            sortBy: "popularity.desc",
                            page: 1
                        ), let firstMovie = movies.first,
                           let backdropPath = firstMovie.backdropPath {
                            let imageURL = "https://image.tmdb.org/t/p/w780\(backdropPath)"
                            return (genre.id, imageURL)
                        }
                        return (genre.id, nil)
                    }
                }
                
                // Collect results and update genres
                for await (genreId, imageURL) in group {
                    if let imageURL = imageURL,
                       let index = genres.firstIndex(where: { $0.id == genreId }) {
                        genres[index].imageURL = imageURL
                    }
                }
            }
            
            isLoading = false
            
            #if DEBUG
            print("✅ Loaded genre images")
            #endif
        } catch {
            print("❌ Error loading genre images: \(error)")
            isLoading = false
        }
    }
}
