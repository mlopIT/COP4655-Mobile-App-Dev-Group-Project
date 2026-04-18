import SwiftUI
import Auth

struct ProfileScreen: View {
    @EnvironmentObject var authService: AuthService
    @Binding var selectedTab: AppTab
    @State private var showSidebar = false
    @State private var selectedProfileTab: ProfileTab = .ratings
    @State private var showSignOutAlert = false
    
    // Profile data
    @State private var userRatings: [Media] = []
    @State private var userReviews: [Media] = []
    @State private var watchlist: [Media] = []
    @State private var isLoading = false
    
    enum ProfileTab: String, CaseIterable {
        case ratings = "RATINGS"
        case reviews = "REVIEWS"
        case watchlist = "WATCHLIST"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                ProfileHeader(showSidebar: $showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                if authService.isAuthenticated {
                    // Authenticated View
                    ScrollView {
                        VStack(spacing: AppSpacing.xl) {
                            // Profile Info Card
                            ProfileInfoCard(
                                ratingsCount: userRatings.count,
                                reviewsCount: userReviews.count,
                                watchlistCount: watchlist.count
                            )
                            .padding(.horizontal, AppSpacing.lg)
                            
                            // Tab Selector
                            ProfileTabSelector(selectedTab: $selectedProfileTab)
                                .padding(.horizontal, AppSpacing.lg)
                            
                            // Content based on selected tab
                            if isLoading {
                                ProfileLoadingState()
                            } else {
                                switch selectedProfileTab {
                                case .ratings:
                                    if userRatings.isEmpty {
                                        ProfileEmptyState(type: .ratings)
                                    } else {
                                        ProfileMediaGrid(media: userRatings)
                                    }
                                case .reviews:
                                    if userReviews.isEmpty {
                                        ProfileEmptyState(type: .reviews)
                                    } else {
                                        ProfileMediaGrid(media: userReviews)
                                    }
                                case .watchlist:
                                    if watchlist.isEmpty {
                                        ProfileEmptyState(type: .watchlist)
                                    } else {
                                        ProfileMediaGrid(media: watchlist)
                                    }
                                }
                            }
                            
                            // Settings Section
                            ProfileSettingsSection(onSignOut: {
                                showSignOutAlert = true
                            })
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.bottom, 120) // Space for bottom nav
                        }
                        .padding(.top, AppSpacing.md)
                    }
                } else {
                    // Not Authenticated View
                    ProfileUnauthenticatedState()
                }
            }
            
            // Bottom Navigation
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar
            Sidebar(isShowing: $showSidebar, isLoggedIn: authService.isAuthenticated)
        }
        .alert("Sign Out", isPresented: $showSignOutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Sign Out", role: .destructive) {
                Task {
                    try? await authService.signOut()
                }
            }
        } message: {
            Text("Are you sure you want to sign out?")
        }
        .task {
            if authService.isAuthenticated {
                await loadUserData()
            }
        }
    }
    
    // MARK: - Data Loading
    
    private func loadUserData() async {
        isLoading = true
        
        // Simulate loading - replace with actual API calls
        try? await Task.sleep(for: .seconds(1))
        
        // Mock data for now
        userRatings = []
        userReviews = []
        watchlist = []
        
        isLoading = false
    }
}

// MARK: - Header

struct ProfileHeader: View {
    @Binding var showSidebar: Bool
    
    var body: some View {
        HStack {
            Text("PROFILE")
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

// MARK: - Profile Info Card

struct ProfileInfoCard: View {
    @EnvironmentObject var authService: AuthService
    let ratingsCount: Int
    let reviewsCount: Int
    let watchlistCount: Int
    
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            // Profile Picture & Name
            VStack(spacing: AppSpacing.md) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [AppColors.primary, AppColors.primaryContainer],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 100, height: 100)
                    
                    Text(getUserInitials())
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                }
                
                VStack(spacing: AppSpacing.sm) {
                    Text(getUserName())
                        .font(AppFonts.displayMedium)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                    
                    if let email = authService.currentUser?.email {
                        Text(email)
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                }
            }
            
            // Stats
            HStack(spacing: 0) {
                ProfileStatItem(value: "\(ratingsCount)", label: "Ratings")
                    .frame(maxWidth: .infinity)
                
                Divider()
                    .frame(height: 40)
                    .background(AppColors.outlineVariant)
                
                ProfileStatItem(value: "\(reviewsCount)", label: "Reviews")
                    .frame(maxWidth: .infinity)
                
                Divider()
                    .frame(height: 40)
                    .background(AppColors.outlineVariant)
                
                ProfileStatItem(value: "\(watchlistCount)", label: "Watchlist")
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical, AppSpacing.md)
        }
        .padding(AppSpacing.lg)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.lg)
    }
    
    private func getUserInitials() -> String {
        if let email = authService.currentUser?.email {
            let components = email.components(separatedBy: "@")
            if let firstPart = components.first, !firstPart.isEmpty {
                return String(firstPart.prefix(2)).uppercased()
            }
        }
        return "U"
    }
    
    private func getUserName() -> String {
        if let email = authService.currentUser?.email {
            return email.components(separatedBy: "@").first?.capitalized ?? "User"
        }
        return "User"
    }
}

struct ProfileStatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
            Text(value)
                .font(AppFonts.displayMedium)
                .fontWeight(.bold)
                .foregroundColor(AppColors.primary)
            
            Text(label)
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .tracking(1)
        }
    }
}

// MARK: - Tab Selector

struct ProfileTabSelector: View {
    @Binding var selectedTab: ProfileScreen.ProfileTab
    
    var body: some View {
        HStack(spacing: AppSpacing.sm) {
            ForEach(ProfileScreen.ProfileTab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    Text(tab.rawValue)
                        .font(AppFonts.label)
                        .fontWeight(.bold)
                        .foregroundColor(selectedTab == tab ? AppColors.onSurface : AppColors.onSurfaceVariant)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, AppSpacing.md)
                        .background(selectedTab == tab ? AppColors.primaryContainer : AppColors.surfaceContainer)
                        .cornerRadius(AppRadius.md)
                }
            }
        }
    }
}

// MARK: - States

struct ProfileLoadingState: View {
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            ProgressView()
                .tint(AppColors.primary)
                .scaleEffect(1.5)
            
            Text("Loading...")
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurfaceVariant)
        }
        .frame(height: 200)
    }
}

struct ProfileEmptyState: View {
    let type: ProfileScreen.ProfileTab
    
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Image(systemName: iconName)
                .font(.system(size: 50))
                .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            
            VStack(spacing: AppSpacing.sm) {
                Text(title)
                    .font(AppFonts.headlineLarge)
                    .foregroundColor(AppColors.onSurface)
                
                Text(message)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, AppSpacing.xl)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, AppSpacing.lg)
    }
    
    private var iconName: String {
        switch type {
        case .ratings: return "star.slash"
        case .reviews: return "square.and.pencil.slash"
        case .watchlist: return "bookmark.slash"
        }
    }
    
    private var title: String {
        switch type {
        case .ratings: return "No Ratings Yet"
        case .reviews: return "No Reviews Yet"
        case .watchlist: return "Watchlist Empty"
        }
    }
    
    private var message: String {
        switch type {
        case .ratings: 
            return "Start rating movies and TV shows to build your collection"
        case .reviews: 
            return "Share your thoughts about the movies and shows you've watched"
        case .watchlist: 
            return "Save movies and shows you want to watch later"
        }
    }
}

struct ProfileUnauthenticatedState: View {
    var body: some View {
        VStack(spacing: AppSpacing.xl) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(AppColors.surfaceContainerHigh)
                    .frame(width: 100, height: 100)
                
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 50))
                    .foregroundColor(AppColors.primary)
            }
            
            VStack(spacing: AppSpacing.md) {
                Text("Create Your Profile")
                    .font(AppFonts.displayMedium)
                    .foregroundColor(AppColors.onSurface)
                    .multilineTextAlignment(.center)
                
                Text("Sign in to track your ratings, reviews, and watchlist")
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

// MARK: - Media Grid

struct ProfileMediaGrid: View {
    let media: [Media]
    
    let columns = [
        GridItem(.flexible(), spacing: AppSpacing.md),
        GridItem(.flexible(), spacing: AppSpacing.md),
        GridItem(.flexible(), spacing: AppSpacing.md)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: AppSpacing.md) {
            ForEach(media) { item in
                NavigationLink(destination: MediaDetailScreen(media: item)) {
                    ProfileMediaPoster(media: item)
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct ProfileMediaPoster: View {
    let media: Media
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Poster
            if let posterPath = media.posterPath,
               let url = URL(string: "https://image.tmdb.org/t/p/w185\(posterPath)") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fill)
                            .clipped()
                    default:
                        posterPlaceholder
                    }
                }
            } else {
                posterPlaceholder
            }
        }
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
    
    private var posterPlaceholder: some View {
        Rectangle()
            .fill(AppColors.surfaceContainerHigh)
            .aspectRatio(2/3, contentMode: .fill)
            .overlay {
                Image(systemName: media.type == .movie ? "film.fill" : "tv.fill")
                    .foregroundColor(AppColors.onSurfaceVariant.opacity(0.3))
            }
    }
}

// MARK: - Settings Section

struct ProfileSettingsSection: View {
    let onSignOut: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("SETTINGS")
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
                .tracking(1.5)
            
            VStack(spacing: 0) {
                ProfileSettingsItem(
                    icon: "person.circle",
                    title: "Edit Profile",
                    action: { print("Edit profile") }
                )
                
                Divider()
                    .background(AppColors.outlineVariant)
                    .padding(.horizontal, AppSpacing.md)
                
                ProfileSettingsItem(
                    icon: "bell",
                    title: "Notifications",
                    action: { print("Notifications") }
                )
                
                Divider()
                    .background(AppColors.outlineVariant)
                    .padding(.horizontal, AppSpacing.md)
                
                ProfileSettingsItem(
                    icon: "lock",
                    title: "Privacy & Security",
                    action: { print("Privacy") }
                )
                
                Divider()
                    .background(AppColors.outlineVariant)
                    .padding(.horizontal, AppSpacing.md)
                
                ProfileSettingsItem(
                    icon: "rectangle.portrait.and.arrow.right",
                    title: "Sign Out",
                    isDestructive: true,
                    action: onSignOut
                )
            }
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
    }
}

struct ProfileSettingsItem: View {
    let icon: String
    let title: String
    var isDestructive: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isDestructive ? .red : AppColors.primary)
                    .frame(width: 30)
                
                Text(title)
                    .font(AppFonts.body)
                    .foregroundColor(isDestructive ? .red : AppColors.onSurface)
                
                Spacer()
                
                if !isDestructive {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
            }
            .padding(AppSpacing.md)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Preview

#Preview("Authenticated") {
    MainTabContainer()
}

#Preview("Unauthenticated") {
    MainTabContainer()
}
