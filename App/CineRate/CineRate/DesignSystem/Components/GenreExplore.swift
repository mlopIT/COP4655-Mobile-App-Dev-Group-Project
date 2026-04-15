import SwiftUI

// MARK: - Data Model
struct Genre: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String // your asset name in Assets.xcassets
}

// MARK: - Genre Row Card
struct GenreRowCard: View {
    let genre: Genre
    var onTap: () -> Void = {}

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .leading) {
                // Background image, clipped to pill shape
                Image(genre.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .clipped()

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
                    .foregroundColor(AppColors.onSurface)
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
    let genres: [Genre] = [
        Genre(name: "THRILLER", imageName: "genre_thriller"),
        Genre(name: "SCIFI",    imageName: "genre_scifi"),
        Genre(name: "CLASSIC",  imageName: "genre_classic"),
    ]

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
                    }
                }

                DiscoverMoreRow {
                    print("Discover More tapped")
                }
            }
        }
        .padding(AppSpacing.lg)
        .background(AppColors.surface)
    }
}
