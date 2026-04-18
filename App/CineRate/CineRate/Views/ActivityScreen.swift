import SwiftUI
import Auth

struct ActivityScreen: View {
    @EnvironmentObject var authService: AuthService
    @Binding var selectedTab: AppTab
    @State private var showSidebar = false
    @State private var selectedFilter: ActivityFilter = .all
    @State private var activities: [ActivityItem] = []
    @State private var isLoading = false
    
    enum ActivityFilter: String, CaseIterable {
        case all = "ALL"
        case reviews = "REVIEWS"
        case ratings = "RATINGS"
        case watchlist = "WATCHLIST"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                ActivityHeader(showSidebar: $showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                if authService.isAuthenticated {
                    // Authenticated View
                    VStack(spacing: 0) {
                        // Filter Pills
                        ActivityFilterPills(selectedFilter: $selectedFilter)
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.vertical, AppSpacing.md)
                        
                        // Activity Feed
                        if isLoading {
                            ActivityLoadingState()
                        } else if activities.isEmpty {
                            ActivityEmptyState(filter: selectedFilter)
                        } else {
                            ActivityFeed(activities: filteredActivities)
                        }
                    }
                } else {
                    // Not Authenticated View
                    ActivityUnauthenticatedState()
                }
            }
            
            // Bottom Navigation
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar
            Sidebar(isShowing: $showSidebar, isLoggedIn: authService.isAuthenticated)
        }
        .task {
            if authService.isAuthenticated {
                await loadActivities()
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var filteredActivities: [ActivityItem] {
        switch selectedFilter {
        case .all:
            return activities
        case .reviews:
            return activities.filter { $0.type == .review }
        case .ratings:
            return activities.filter { $0.type == .rating }
        case .watchlist:
            return activities.filter { $0.type == .watchlistAdd }
        }
    }
    
    // MARK: - Data Loading
    
    private func loadActivities() async {
        isLoading = true
        
        // Simulate loading - replace with actual API call
        try? await Task.sleep(for: .seconds(1))
        
        // Mock data for now
        activities = generateMockActivities()
        
        isLoading = false
    }
    
    private func generateMockActivities() -> [ActivityItem] {
        // This would be replaced with actual data from your backend
        return []
    }
}

// MARK: - Activity Item Model

struct ActivityItem: Identifiable {
    let id = UUID()
    let type: ActivityType
    let mediaTitle: String
    let mediaType: MediaType
    let timestamp: Date
    let rating: Double?
    let review: String?
    let mediaPosterPath: String?
    
    enum ActivityType {
        case review
        case rating
        case watchlistAdd
    }
}

// MARK: - Header

struct ActivityHeader: View {
    @Binding var showSidebar: Bool
    
    var body: some View {
        HStack {
            Text("ACTIVITY")
                .font(AppFonts.title)
                .tracking(2)
                .foregroundColor(AppColors.onSurface)
            
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
        .padding(.top, 40)
    }
}

// MARK: - Filter Pills

struct ActivityFilterPills: View {
    @Binding var selectedFilter: ActivityScreen.ActivityFilter
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppSpacing.md) {
                ForEach(ActivityScreen.ActivityFilter.allCases, id: \.self) { filter in
                    FilterPill(
                        title: filter.rawValue,
                        isSelected: selectedFilter == filter,
                        action: { selectedFilter = filter }
                    )
                }
            }
        }
    }
}

// MARK: - Filter Pill Component

struct FilterPill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppFonts.bodySmall)
                .fontWeight(.semibold)
                .foregroundColor(isSelected ? .white : AppColors.onSurfaceVariant)
                .padding(.horizontal, AppSpacing.lg)
                .padding(.vertical, AppSpacing.sm)
                .background(isSelected ? AppColors.primary : AppColors.surfaceContainer)
                .cornerRadius(AppRadius.full)
        }
    }
}

// MARK: - States

struct ActivityLoadingState: View {
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Spacer()
            
            ProgressView()
                .tint(AppColors.primary)
                .scaleEffect(1.5)
            
            Text("Loading your activity...")
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurfaceVariant)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ActivityEmptyState: View {
    let filter: ActivityScreen.ActivityFilter
    
    var body: some View {
        VStack(spacing: AppSpacing.xl) {
            Spacer()
            
            Image(systemName: iconForFilter)
                .font(.system(size: 60))
                .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            
            VStack(spacing: AppSpacing.md) {
                Text(titleForFilter)
                    .font(AppFonts.displayMedium)
                    .foregroundColor(AppColors.onSurface)
                
                Text(messageForFilter)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, AppSpacing.xl)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var iconForFilter: String {
        switch filter {
        case .all: return "bell.slash"
        case .reviews: return "square.and.pencil"
        case .ratings: return "star.slash"
        case .watchlist: return "bookmark.slash"
        }
    }
    
    private var titleForFilter: String {
        switch filter {
        case .all: return "No Activity Yet"
        case .reviews: return "No Reviews Yet"
        case .ratings: return "No Ratings Yet"
        case .watchlist: return "Watchlist Empty"
        }
    }
    
    private var messageForFilter: String {
        switch filter {
        case .all: 
            return "Your activity feed will show your ratings, reviews, and watchlist additions"
        case .reviews: 
            return "Share your thoughts about movies and TV shows you've watched"
        case .ratings: 
            return "Start rating movies and TV shows to track what you've watched"
        case .watchlist: 
            return "Add movies and TV shows to your watchlist to watch later"
        }
    }
}

struct ActivityUnauthenticatedState: View {
    var body: some View {
        VStack(spacing: AppSpacing.xl) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 100, height: 100)
                
                Image(systemName: "bell.badge")
                    .font(.system(size: 50))
                    .foregroundColor(AppColors.primary)
            }
            
            VStack(spacing: AppSpacing.md) {
                Text("Sign In to View Activity")
                    .font(AppFonts.displayMedium)
                    .foregroundColor(AppColors.onSurface)
                    .multilineTextAlignment(.center)
                
                Text("Track your ratings, reviews, and watchlist activity all in one place")
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, AppSpacing.xl)
            }
            
            VStack(spacing: AppSpacing.md) {
                NavigationLink(destination: SignInScreen()) {
                    Text("SIGN IN")
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .frame(height: 48)
                        .background(AppColors.primaryContainer)
                        .cornerRadius(AppRadius.md)
                }
                
                NavigationLink(destination: CreateAccountScreen()) {
                    Text("CREATE ACCOUNT")
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.primary)
                        .frame(maxWidth: 300)
                        .frame(height: 48)
                        .background(AppColors.surfaceContainerHigh)
                        .cornerRadius(AppRadius.md)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppRadius.md)
                                .stroke(AppColors.outlineVariant, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, AppSpacing.lg)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 100)
    }
}

// MARK: - Activity Feed

struct ActivityFeed: View {
    let activities: [ActivityItem]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: AppSpacing.md) {
                ForEach(activities) { activity in
                    ActivityCard(activity: activity)
                }
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, 100) // Space for bottom nav
        }
    }
}

struct ActivityCard: View {
    let activity: ActivityItem
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            // Icon
            ZStack {
                Circle()
                    .fill(iconBackgroundColor)
                    .frame(width: 44, height: 44)
                
                Image(systemName: iconName)
                    .foregroundColor(iconColor)
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                // Action description
                Text(actionDescription)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurface)
                
                // Media title
                Text(activity.mediaTitle)
                    .font(AppFonts.bodySmall)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.primary)
                
                // Timestamp
                Text(formatTimestamp(activity.timestamp))
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            
            Spacer()
            
            // Rating if applicable
            if let rating = activity.rating {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 14))
                    Text(String(format: "%.1f", rating))
                        .font(AppFonts.bodySmall)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                }
            }
        }
        .padding(AppSpacing.md)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
    }
    
    private var iconName: String {
        switch activity.type {
        case .review: return "square.and.pencil"
        case .rating: return "star.fill"
        case .watchlistAdd: return "bookmark.fill"
        }
    }
    
    private var iconColor: Color {
        switch activity.type {
        case .review: return AppColors.primary
        case .rating: return .yellow
        case .watchlistAdd: return AppColors.primary
        }
    }
    
    private var iconBackgroundColor: Color {
        switch activity.type {
        case .review: return AppColors.primaryContainer.opacity(0.3)
        case .rating: return Color.yellow.opacity(0.2)
        case .watchlistAdd: return AppColors.primaryContainer.opacity(0.3)
        }
    }
    
    private var actionDescription: String {
        switch activity.type {
        case .review: return "You reviewed"
        case .rating: return "You rated"
        case .watchlistAdd: return "You added to watchlist"
        }
    }
    
    private func formatTimestamp(_ date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(date) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return "Today at \(formatter.string(from: date))"
        } else if calendar.isDateInYesterday(date) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return "Yesterday at \(formatter.string(from: date))"
        } else if calendar.dateComponents([.day], from: date, to: now).day! < 7 {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE 'at' h:mm a"
            return formatter.string(from: date)
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
    }
}

// MARK: - Preview

#Preview("Authenticated") {
    MainTabContainer()
}

#Preview("Unauthenticated") {
    MainTabContainer()
}
