import SwiftUI

// MARK: - Search Header Section
struct SearchHeaderSection: View {
    @Binding var searchText: String
    @FocusState.Binding var isSearchFieldFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Title
            Text("SEARCH")
                .font(AppFonts.displayLarge)
                .fontWeight(.heavy)
                .foregroundColor(AppColors.onSurface)
                .tracking(1)
            
            // Search Bar
            SearchBarComponent(searchText: $searchText, isSearchFieldFocused: $isSearchFieldFocused)
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

// MARK: - Search Bar Component
struct SearchBarComponent: View {
    @Binding var searchText: String
    @FocusState.Binding var isSearchFieldFocused: Bool
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            // Search Icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColors.onSurfaceVariant)
                .font(.system(size: 20))
            
            // Text Field
            TextField("Search movies, shows, actors...", text: $searchText)
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurface)
                .focused($isSearchFieldFocused)
                .autocorrectionDisabled()
            
            // Clear Button (only show when there's text)
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .font(.system(size: 18))
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.md)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.full) // Pill-shaped search bar
    }
}

// MARK: - Popular Searches Section
struct PopularSearchesSection: View {
    @State private var recentSearches: [String] = []
    let onSearchTap: (String) -> Void
    
    let popularSearches = [
        "Action Movies",
        "Christopher Nolan",
        "Marvel",
        "Sci-Fi Classics",
        "Horror",
        "Comedies",
        "Drama",
        "Thriller",
        "Romance"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xl) {
            
            // Recent Searches (if any)
            if !recentSearches.isEmpty {
                RecentSearchesSection(
                    recentSearches: $recentSearches,
                    onSearchTap: onSearchTap
                )
            }
            
            // Popular/Trending Searches
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                
                // Section Header
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("POPULAR SEARCHES")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .tracking(1.5)
                    
                    Text("TRENDING NOW")
                        .font(AppFonts.displayMedium)
                        .fontWeight(.heavy)
                        .foregroundColor(AppColors.onSurface)
                        .tracking(1)
                }
                
                // Popular Search Tags
                FlowLayout(spacing: AppSpacing.sm) {
                    ForEach(popularSearches, id: \.self) { search in
                        SearchTagButton(title: search) {
                            onSearchTap(search)
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.lg)
        }
        .onAppear {
            recentSearches = RecentSearchManager.shared.getRecentSearches()
        }
    }
}

// MARK: - Recent Searches Section
struct RecentSearchesSection: View {
    @Binding var recentSearches: [String]
    let onSearchTap: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Section Header
            HStack {
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("RECENT")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .tracking(1.5)
                    
                    Text("YOUR SEARCHES")
                        .font(AppFonts.displayMedium)
                        .fontWeight(.heavy)
                        .foregroundColor(AppColors.onSurface)
                        .tracking(1)
                }
                
                Spacer()
                
                // Clear All Button
                Button(action: {
                    RecentSearchManager.shared.clearAll()
                    recentSearches = []
                }) {
                    Text("CLEAR")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.primary)
                }
            }
            
            // Recent Search Items
            VStack(spacing: AppSpacing.sm) {
                ForEach(recentSearches, id: \.self) { search in
                    RecentSearchRow(searchText: search) {
                        onSearchTap(search)
                    } onDelete: {
                        RecentSearchManager.shared.removeSearch(search)
                        recentSearches = RecentSearchManager.shared.getRecentSearches()
                    }
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

// MARK: - Recent Search Row
struct RecentSearchRow: View {
    let searchText: String
    var onTap: () -> Void = {}
    var onDelete: () -> Void = {}
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: AppSpacing.md) {
                // Clock Icon
                Image(systemName: "clock.arrow.circlepath")
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .font(.system(size: 18))
                
                // Search Text
                Text(searchText)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Delete Button
                Button(action: onDelete) {
                    Image(systemName: "xmark")
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .font(.system(size: 14))
                }
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.vertical, AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Search Tag Button
struct SearchTagButton: View {
    let title: String
    var onTap: () -> Void = {}
    
    var body: some View {
        Button(action: onTap) {
            Text(title)
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurface)
                .padding(.horizontal, AppSpacing.lg)
                .padding(.vertical, AppSpacing.md)
                .background(AppColors.surfaceContainerHigh)
                .cornerRadius(AppRadius.full)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Search Results Section
struct SearchResultsSection: View {
    let searchQuery: String
    let results: [Media]
    let isSearching: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Results Header
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("SEARCH RESULTS")
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .tracking(1.5)
                
                if isSearching {
                    HStack(spacing: AppSpacing.sm) {
                        ProgressView()
                            .tint(AppColors.primary)
                            .scaleEffect(0.8)
                        Text("SEARCHING...")
                            .font(AppFonts.title)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.onSurface)
                            .tracking(1)
                    }
                } else {
                    Text("FOUND \(results.count) RESULTS")
                        .font(AppFonts.title)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                        .tracking(1)
                }
            }
            .padding(.horizontal, AppSpacing.lg)
            
            if isSearching {
                // Loading skeletons
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: AppSpacing.md),
                    GridItem(.flexible(), spacing: AppSpacing.md)
                ], spacing: AppSpacing.md) {
                    ForEach(0..<6, id: \.self) { _ in
                        SearchResultCardSkeleton()
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
            } else if results.isEmpty {
                // Empty state
                VStack(spacing: AppSpacing.md) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 60))
                        .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
                    
                    Text("No results found")
                        .font(AppFonts.title)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text("Try different keywords")
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.xxl)
            } else {
                // Results Grid
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: AppSpacing.md),
                    GridItem(.flexible(), spacing: AppSpacing.md)
                ], spacing: AppSpacing.md) {
                    ForEach(results) { media in
                        SearchResultCardComponent(media: media)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
            }
        }
    }
}

// MARK: - Search Result Card (Updated for Real Data)
struct SearchResultCardComponent: View {
    let media: Media
    var onTap: () -> Void = {}
    
    var body: some View {
        NavigationLink(destination: MediaDetailScreen(media: media)) {
            VStack(alignment: .leading, spacing: 0) {
                
                // Movie/TV Poster
                ZStack(alignment: .topTrailing) {
                    if let posterPath = media.posterPath,
                       let url = URL(string: "https://image.tmdb.org/t/p/w342\(posterPath)") {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                Rectangle()
                                    .fill(AppColors.surfaceContainer)
                                    .aspectRatio(2/3, contentMode: .fill)
                                    .overlay {
                                        ProgressView()
                                            .tint(AppColors.primary)
                                    }
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(2/3, contentMode: .fill)
                            case .failure:
                                posterPlaceholder
                            @unknown default:
                                posterPlaceholder
                            }
                        }
                    } else {
                        posterPlaceholder
                    }
                    
                    // Type Badge
                    Text(media.type == .movie ? "MOVIE" : "TV")
                        .font(AppFonts.label)
                        .foregroundColor(.white)
                        .padding(.horizontal, AppSpacing.sm)
                        .padding(.vertical, 4)
                        .background(.ultraThinMaterial)
                        .cornerRadius(AppRadius.md)
                        .padding(AppSpacing.sm)
                }
                .frame(maxWidth: .infinity)
                .clipped()
                
                // Movie Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(media.title.uppercased())
                        .font(AppFonts.body)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    if !media.releaseDate.isEmpty {
                        Text(String(media.releaseDate.prefix(4)))
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                    
                    // Rating
                    if let rating = media.voteAverage {
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", rating))
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurface)
                        }
                    }
                }
                .padding(AppSpacing.md)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppColors.surfaceContainer)
            }
            .cornerRadius(AppRadius.md)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var posterPlaceholder: some View {
        Rectangle()
            .fill(AppColors.surfaceContainer)
            .aspectRatio(2/3, contentMode: .fill)
            .overlay {
                Image(systemName: media.type == .movie ? "film.fill" : "tv.fill")
                    .font(.system(size: 30))
                    .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            }
    }
}

// MARK: - Search Result Card Skeleton
struct SearchResultCardSkeleton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .fill(AppColors.surfaceContainer)
                .aspectRatio(2/3, contentMode: .fill)
                .shimmer()
            
            VStack(alignment: .leading, spacing: 4) {
                Rectangle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(height: 14)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 60, height: 12)
                    .cornerRadius(4)
            }
            .padding(AppSpacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.surfaceContainer)
        }
        .cornerRadius(AppRadius.md)
    }
}

// MARK: - Flow Layout for Tags
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            spacing: spacing
        )
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(
            in: bounds.width,
            subviews: subviews,
            spacing: spacing
        )
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x, y: bounds.minY + result.positions[index].y), proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var lineHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += lineHeight + spacing
                    lineHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                lineHeight = max(lineHeight, size.height)
                x += size.width + spacing
            }
            
            self.size = CGSize(width: maxWidth, height: y + lineHeight)
        }
    }
}
