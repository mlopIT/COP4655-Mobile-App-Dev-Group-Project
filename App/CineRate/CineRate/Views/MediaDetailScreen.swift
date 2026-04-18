import SwiftUI
import Auth

struct MediaDetailScreen: View {
    let media: Media
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authService: AuthService
    @State private var showSidebar = false
    @State private var isInWatchlist = false
    @State private var showRateReview = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // Background
                AppColors.surface
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Top Navigation Bar
                    MediaDetailNavigationBar(
                        showSidebar: $showSidebar,
                        onDismiss: { dismiss() }
                    )
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                    
                    // Main Content
                    ScrollView {
                        VStack(spacing: 0) {
                            
                            // Hero Image
                            MediaDetailHero(media: media)
                            
                            // Main Info Section
                            VStack(alignment: .leading, spacing: AppSpacing.xl) {
                                
                                // Title and Quick Info
                                MediaDetailHeader(media: media)
                                    .padding(.horizontal, AppSpacing.lg)
                                
                                // Action Buttons
                                MediaDetailActions(
                                    media: media,
                                    isInWatchlist: $isInWatchlist,
                                    onRateReview: { showRateReview = true }
                                )
                                .padding(.horizontal, AppSpacing.lg)
                                
                                // Overview/Synopsis
                                if !media.overview.isEmpty {
                                    MediaDetailOverview(overview: media.overview)
                                        .padding(.horizontal, AppSpacing.lg)
                                }
                                
                                // Cast & Crew
                                if !media.cast.isEmpty {
                                    MediaDetailCast(cast: media.cast)
                                }
                                
                                // Additional Info
                                MediaDetailInfo(media: media)
                                    .padding(.horizontal, AppSpacing.lg)
                                
                                // Bottom padding for navigation bar
                                Spacer().frame(height: 100)
                            }
                            .padding(.top, AppSpacing.lg)
                        }
                    }
                }
                
                // Bottom Navigation Bar - Hidden on detail screen
                // CustomNavigationBar()
                
                // Sidebar Overlay
                Sidebar(isShowing: $showSidebar, isLoggedIn: authService.isAuthenticated)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showRateReview) {
            RateReviewScreen(media: media)
                .environmentObject(authService)
        }
        .onAppear {
            isInWatchlist = media.isInWatchlist
        }
    }
}

// MARK: - Navigation Bar

struct MediaDetailNavigationBar: View {
    @Binding var showSidebar: Bool
    let onDismiss: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onDismiss) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 44, height: 44)
            }
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showSidebar.toggle()
                }
            }) {
                VStack(spacing: 5) {
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.md)
        .background(AppColors.surface)
    }
}

// MARK: - Hero Section

struct MediaDetailHero: View {
    let media: Media
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                // Backdrop Image
                if let backdropPath = media.backdropPath,
                   let url = URL(string: "https://image.tmdb.org/t/p/original\(backdropPath)") {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            Rectangle()
                                .fill(AppColors.surfaceContainer)
                                .overlay {
                                    ProgressView()
                                        .tint(AppColors.primary)
                                }
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width)
                                .clipped()
                        case .failure:
                            backdropPlaceholder
                        @unknown default:
                            backdropPlaceholder
                        }
                    }
                } else {
                    backdropPlaceholder
                }
                
                // Gradient Overlay
                LinearGradient(
                    gradient: Gradient(colors: [.clear, AppColors.surface]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }
        .frame(height: 250)
        .clipped()
    }
    
    private var backdropPlaceholder: some View {
        Rectangle()
            .fill(AppColors.surfaceContainer)
            .overlay {
                Image(systemName: media.type == .movie ? "film.fill" : "tv.fill")
                    .font(.system(size: 60))
                    .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            }
    }
}

// MARK: - Header Section

struct MediaDetailHeader: View {
    let media: Media
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            // Title
            Text(media.title.uppercased())
                .font(AppFonts.displayLarge)
                .fontWeight(.heavy)
                .foregroundColor(AppColors.onSurface)
                .tracking(1)
            
            // Quick Info Row
            HStack(spacing: AppSpacing.md) {
                // Rating
                if let rating = media.voteAverage {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 16))
                        Text(String(format: "%.1f", rating))
                            .font(AppFonts.body)
                            .foregroundColor(AppColors.onSurface)
                    }
                }
                
                // Year
                if !media.releaseDate.isEmpty {
                    Text("•")
                        .foregroundColor(AppColors.onSurfaceVariant)
                    Text(String(media.releaseDate.prefix(4)))
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurface)
                }
                
                // Type Badge
                Text("•")
                    .foregroundColor(AppColors.onSurfaceVariant)
                Text(media.type == .movie ? "MOVIE" : "TV SHOW")
                    .font(AppFonts.label)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.primary)
            }
            
            // Genres
            if !media.genres.isEmpty {
                Text(media.genres.joined(separator: " • "))
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
        }
    }
}

// MARK: - Action Buttons

struct MediaDetailActions: View {
    let media: Media
    @Binding var isInWatchlist: Bool
    let onRateReview: () -> Void
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            // Rate & Review Button
            Button(action: onRateReview) {
                HStack {
                    Image(systemName: "star.fill")
                    Text("RATE & REVIEW")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(PrimaryButtonStyle())
            
            // Watchlist Button
            Button(action: {
                isInWatchlist.toggle()
                // TODO: Add to watchlist via WatchlistService
            }) {
                Image(systemName: isInWatchlist ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.onSurface)
            }
            .frame(width: 50, height: 50)
            .background(AppColors.surfaceContainerHigh)
            .cornerRadius(AppRadius.md)
        }
    }
}

// MARK: - Overview Section

struct MediaDetailOverview: View {
    let overview: String
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            Text("SYNOPSIS")
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .tracking(1.5)
            
            Text(overview)
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurface)
                .lineLimit(isExpanded ? nil : 4)
            
            if overview.count > 200 {
                Button(action: { isExpanded.toggle() }) {
                    Text(isExpanded ? "Show Less" : "Read More")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.primary)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

// MARK: - Cast Section

struct MediaDetailCast: View {
    let cast: [CastMember]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("CAST")
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .tracking(1.5)
                .padding(.horizontal, AppSpacing.lg)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppSpacing.md) {
                    ForEach(cast.prefix(10)) { member in
                        CastMemberCard(member: member)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
            }
        }
    }
}

struct CastMemberCard: View {
    let member: CastMember
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
            // Profile Image
            if let profileImage = member.profileImage,
               let url = URL(string: "https://image.tmdb.org/t/p/w185\(profileImage)") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    default:
                        profilePlaceholder
                    }
                }
            } else {
                profilePlaceholder
            }
            
            // Name
            Text(member.name)
                .font(AppFonts.bodySmall)
                .fontWeight(.semibold)
                .foregroundColor(AppColors.onSurface)
                .lineLimit(1)
                .frame(width: 80)
            
            // Character
            Text(member.character)
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .lineLimit(1)
                .frame(width: 80)
        }
        .frame(width: 80)
    }
    
    private var profilePlaceholder: some View {
        Circle()
            .fill(AppColors.surfaceContainer)
            .frame(width: 80, height: 80)
            .overlay {
                Image(systemName: "person.fill")
                    .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            }
    }
}

// MARK: - Additional Info Section

struct MediaDetailInfo: View {
    let media: Media
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("ADDITIONAL INFO")
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .tracking(1.5)
            
            VStack(spacing: AppSpacing.sm) {
                if !media.releaseDate.isEmpty {
                    InfoRow(
                        label: "Release Date",
                        value: formatReleaseDate(media.releaseDate)
                    )
                }
                
                if let rating = media.voteAverage {
                    InfoRow(
                        label: "TMDB Rating",
                        value: String(format: "%.1f/10", rating)
                    )
                }
                
                if let runtime = media.runtime {
                    InfoRow(
                        label: "Runtime",
                        value: runtime
                    )
                }
                
                if media.type == .tvShow, let seasons = media.seasonCount {
                    InfoRow(
                        label: "Seasons",
                        value: "\(seasons)"
                    )
                }
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
    }
    
    private func formatReleaseDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .long
            return formatter.string(from: date)
        }
        return dateString
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurfaceVariant)
            Spacer()
            Text(value)
                .font(AppFonts.body)
                .fontWeight(.semibold)
                .foregroundColor(AppColors.onSurface)
        }
    }
}

// MARK: - Preview

#Preview {
    MediaDetailScreen(media: Media(
        id: "1",
        type: .movie,
        title: "The Matrix",
        releaseYear: "1999",
        runtime: "2h 16m",
        rating: "R",
        genres: ["Action", "Science Fiction"],
        posterImage: "/path/to/poster.jpg",
        backdropImage: "/path/to/backdrop.jpg",
        overview: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
        director: "The Wachowskis",
        creators: nil,
        cast: [],
        averageRating: 4.35,
        totalRatings: 1500,
        userRating: nil,
        isInWatchlist: false,
        seasonCount: nil,
        episodeCount: nil,
        status: nil,
        trailerURL: nil,
        releaseDate: "March 31, 1999"
    ))
    .environmentObject(AuthService())
}
