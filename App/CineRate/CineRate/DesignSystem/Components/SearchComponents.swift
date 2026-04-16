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
            SearchBar(searchText: $searchText, isSearchFieldFocused: $isSearchFieldFocused)
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

// MARK: - Search Bar Component
struct SearchBar: View {
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
    let popularSearches = [
        "Action Movies",
        "Christopher Nolan",
        "Marvel",
        "Sci-Fi Classics",
        "Horror",
        "Comedies"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xl) {
            
            // Recent Searches (if any)
            RecentSearchesSection()
            
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
                        SearchTagButton(title: search)
                    }
                }
            }
            .padding(.horizontal, AppSpacing.lg)
        }
    }
}

// MARK: - Recent Searches Section
struct RecentSearchesSection: View {
    // Sample recent searches - in a real app, this would come from UserDefaults or a database
    let recentSearches = [
        "Inception",
        "The Matrix",
        "Blade Runner"
    ]
    
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
                    print("Clear all recent searches")
                }) {
                    Text("CLEAR")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.primary)
                }
            }
            
            // Recent Search Items
            VStack(spacing: AppSpacing.sm) {
                ForEach(recentSearches, id: \.self) { search in
                    RecentSearchRow(searchText: search)
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
    
    // Sample data - replace with actual search results
    let sampleMovies = [
        SearchResultItem(id: "1", title: "THE DARK KNIGHT", year: "2008", type: "MOVIE", imageName: "film image"),
        SearchResultItem(id: "2", title: "INCEPTION", year: "2010", type: "MOVIE", imageName: "film image"),
        SearchResultItem(id: "3", title: "INTERSTELLAR", year: "2014", type: "MOVIE", imageName: "film image"),
        SearchResultItem(id: "4", title: "THE PRESTIGE", year: "2006", type: "MOVIE", imageName: "film image"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Results Header
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("SEARCH RESULTS")
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .tracking(1.5)
                
                Text("FOUND \(sampleMovies.count) RESULTS")
                    .font(AppFonts.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.onSurface)
                    .tracking(1)
            }
            .padding(.horizontal, AppSpacing.lg)
            
            // Results Grid
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: AppSpacing.md),
                GridItem(.flexible(), spacing: AppSpacing.md)
            ], spacing: AppSpacing.md) {
                ForEach(sampleMovies) { movie in
                    SearchResultCard(item: movie)
                }
            }
            .padding(.horizontal, AppSpacing.lg)
        }
    }
}

// MARK: - Search Result Data Model
struct SearchResultItem: Identifiable {
    let id: String
    let title: String
    let year: String
    let type: String
    let imageName: String
}

// MARK: - Search Result Card
struct SearchResultCard: View {
    let item: SearchResultItem
    var onTap: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Movie Poster
            ZStack(alignment: .topTrailing) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                // Type Badge
                Text(item.type)
                    .font(AppFonts.label)
                    .foregroundColor(.white)
                    .padding(.horizontal, AppSpacing.sm)
                    .padding(.vertical, 4)
                    .background(.ultraThinMaterial)
                    .cornerRadius(AppRadius.md)
                    .padding(AppSpacing.sm)
            }
            
            // Movie Info
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(AppFonts.body)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.onSurface)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(item.year)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(AppSpacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColors.surfaceContainer)
        }
        .cornerRadius(AppRadius.md)
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        .onTapGesture {
            onTap()
        }
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
