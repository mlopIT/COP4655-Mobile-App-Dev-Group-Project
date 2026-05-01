// File Name: NavigationCoordinator.swift
import SwiftUI
import Combine

/// Represents all possible navigation destinations in the app
enum NavigationDestination: Hashable {
    case home
    case trending
    case topRated
    case movies
    case tvShows
    case genres
    case myRatings
    case watchlist
    case favorites
    case watchHistory
    case myReviews
    case following
    case activity
    case discussions
    case settings
    case helpSupport
    case about
    case signIn
    case createAccount
    case termsPrivacy
    case search
    case mediaDetail(mediaId: Int, mediaType: String)
}

/// Coordinator that manages app-wide navigation
@MainActor
final class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var showSidebar = false
    
    /// Navigate to a specific destination
    func navigate(to destination: NavigationDestination) {
        path.append(destination)
        closeSidebar()
    }
    
    /// Navigate back to root
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    /// Navigate back one screen
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// Toggle sidebar visibility
    func toggleSidebar() {
        withAnimation(.easeInOut(duration: 0.3)) {
            showSidebar.toggle()
        }
    }
    
    /// Close sidebar
    func closeSidebar() {
        withAnimation(.easeInOut(duration: 0.3)) {
            showSidebar = false
        }
    }
    
    /// View builder for navigation destinations
    @ViewBuilder
    static func view(for destination: NavigationDestination) -> some View {
        switch destination {
        case .home:
            Text("Home")
                .font(.largeTitle)
        
        case .trending:
            PlaceholderScreen(title: "Trending", icon: "flame.fill")
        
        case .topRated:
            PlaceholderScreen(title: "Top Rated", icon: "star.fill")
        
        case .movies:
            PlaceholderScreen(title: "Movies", icon: "film.fill")
        
        case .tvShows:
            PlaceholderScreen(title: "TV Shows", icon: "tv.fill")
        
        case .genres:
            PlaceholderScreen(title: "Genres", icon: "tag.fill")
        
        case .myRatings:
            PlaceholderScreen(title: "My Ratings", icon: "star.circle.fill")
        
        case .watchlist:
            PlaceholderScreen(title: "Watchlist", icon: "bookmark.fill")
        
        case .favorites:
            PlaceholderScreen(title: "Favorites", icon: "heart.fill")
        
        case .watchHistory:
            PlaceholderScreen(title: "Watch History", icon: "clock.fill")
        
        case .myReviews:
            PlaceholderScreen(title: "My Reviews", icon: "square.and.pencil")
        
        case .following:
            PlaceholderScreen(title: "Following", icon: "person.2.fill")
        
        case .activity:
            PlaceholderScreen(title: "Activity", icon: "bell.fill")
        
        case .discussions:
            PlaceholderScreen(title: "Discussions", icon: "bubble.left.and.bubble.right.fill")
        
        case .settings:
            SettingsScreen()
        
        case .helpSupport:
            HelpSupportScreen()
        
        case .about:
            AboutScreen()
        
        case .signIn:
            PlaceholderScreen(title: "Sign In", icon: "person.fill")
        
        case .createAccount:
            PlaceholderScreen(title: "Create Account", icon: "person.badge.plus")
        
        case .termsPrivacy:
            PlaceholderScreen(title: "Terms & Privacy", icon: "doc.text.fill")
        
        case .search:
            PlaceholderScreen(title: "Search", icon: "magnifyingglass")
        
        case .mediaDetail(let mediaId, let mediaType):
            PlaceholderScreen(title: "\(mediaType) Detail #\(mediaId)", icon: "film")
        }
    }
}

/// Placeholder screen for features not yet implemented
struct PlaceholderScreen: View {
    let title: String
    let icon: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: AppSpacing.xl) {
                ZStack {
                    Circle()
                        .fill(AppColors.surfaceContainerHigh)
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: icon)
                        .font(.system(size: 50))
                        .foregroundColor(AppColors.primary)
                }
                
                VStack(spacing: AppSpacing.md) {
                    Text(title)
                        .font(AppFonts.headlineLarge)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text("This feature is coming soon")
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Go Back")
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 48)
                        .background(AppColors.primaryContainer)
                        .cornerRadius(AppRadius.md)
                }
                .padding(.top, AppSpacing.lg)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                Text("Back")
            }
            .foregroundColor(AppColors.primary)
        })
    }
}
