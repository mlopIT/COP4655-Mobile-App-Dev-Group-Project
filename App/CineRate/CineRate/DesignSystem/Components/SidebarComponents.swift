// File Name: SidebarComponents.swift
import SwiftUI

// MARK: - Sidebar Container
/// Main sidebar component that displays different content based on login state
struct Sidebar: View {
    @Binding var isShowing: Bool
    let isLoggedIn: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Dimmed Background
            if isShowing {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isShowing = false
                        }
                    }
            }
            
            // Sidebar Content
            if isShowing {
                HStack(spacing: 0) {
                    Spacer()
                    
                    if isLoggedIn {
                        LoggedInSidebarContent(isShowing: $isShowing)
                    } else {
                        LoggedOutSidebarContent(isShowing: $isShowing)
                    }
                }
                .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isShowing)
    }
}

// MARK: - Logged In Sidebar
struct LoggedInSidebarContent: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section with Profile
            VStack(spacing: AppSpacing.md) {
                // Close Button
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isShowing = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(AppColors.onSurfaceVariant)
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, AppSpacing.md)
                
                // Profile Section
                HStack(spacing: AppSpacing.md) {
                    // Profile Image
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [AppColors.primary, AppColors.primaryContainer],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 60, height: 60)
                        
                        Text("JD")
                            .font(AppFonts.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("John Doe")
                            .font(AppFonts.title)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.onSurface)
                        
                        Text("@johndoe")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, AppSpacing.lg)
                
                // Stats Quick View
                HStack(spacing: AppSpacing.lg) {
                    SidebarStatItem(value: "147", label: "Ratings")
                    SidebarStatItem(value: "32", label: "Reviews")
                    SidebarStatItem(value: "89", label: "Watchlist")
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.vertical, AppSpacing.md)
            }
            .padding(.bottom, AppSpacing.lg)
            .background(AppColors.surfaceContainer)
            
            // Menu Items
            ScrollView {
                VStack(spacing: AppSpacing.sm) {
                    // Discover Section
                    SidebarSectionHeader(title: "DISCOVER")
                    
                    SidebarMenuItem(
                        icon: "house.fill",
                        title: "Home",
                        action: { print("Home tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "flame.fill",
                        title: "Trending",
                        action: { print("Trending tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "star.fill",
                        title: "Top Rated",
                        action: { print("Top Rated tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "film.fill",
                        title: "Movies",
                        action: { print("Movies tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "tv.fill",
                        title: "TV Shows",
                        action: { print("TV Shows tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "tag.fill",
                        title: "Genres",
                        action: { print("Genres tapped") }
                    )
                    
                    // Library Section
                    SidebarSectionHeader(title: "MY LIBRARY")
                        .padding(.top, AppSpacing.md)
                    
                    SidebarMenuItem(
                        icon: "star.circle.fill",
                        title: "My Ratings",
                        badge: "147",
                        action: { print("My Ratings tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "bookmark.fill",
                        title: "Watchlist",
                        badge: "89",
                        action: { print("Watchlist tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "heart.fill",
                        title: "Favorites",
                        badge: "42",
                        action: { print("Favorites tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "clock.fill",
                        title: "Watch History",
                        action: { print("Watch History tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "square.and.pencil",
                        title: "My Reviews",
                        badge: "32",
                        action: { print("My Reviews tapped") }
                    )
                    
                    // Social Section
                    SidebarSectionHeader(title: "SOCIAL")
                        .padding(.top, AppSpacing.md)
                    
                    SidebarMenuItem(
                        icon: "person.2.fill",
                        title: "Following",
                        action: { print("Following tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "bell.fill",
                        title: "Activity",
                        badge: "3",
                        action: { print("Activity tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "bubble.left.and.bubble.right.fill",
                        title: "Discussions",
                        action: { print("Discussions tapped") }
                    )
                    
                    // Settings Section
                    SidebarSectionHeader(title: "MORE")
                        .padding(.top, AppSpacing.md)
                    
                    SidebarMenuItem(
                        icon: "gearshape.fill",
                        title: "Settings",
                        action: { print("Settings tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "questionmark.circle.fill",
                        title: "Help & Support",
                        action: { print("Help tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "info.circle.fill",
                        title: "About",
                        action: { print("About tapped") }
                    )
                }
                .padding(.top, AppSpacing.md)
            }
            
            Spacer()
            
            // Footer - Sign Out
            VStack(spacing: 0) {
                Divider()
                    .background(AppColors.outlineVariant)
                
                Button(action: {
                    print("Sign Out tapped")
                }) {
                    HStack(spacing: AppSpacing.md) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .font(.system(size: 20))
                            .foregroundColor(AppColors.primary)
                        
                        Text("Sign Out")
                            .font(AppFonts.body)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.primary)
                        
                        Spacer()
                    }
                    .padding(AppSpacing.lg)
                }
            }
            .background(AppColors.surfaceContainer)
        }
        .frame(width: 300)
        .background(AppColors.surface)
        .shadow(color: .black.opacity(0.3), radius: 20, x: -5, y: 0)
    }
}

// MARK: - Logged Out Sidebar
struct LoggedOutSidebarContent: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header Section
            VStack(spacing: AppSpacing.lg) {
                // Close Button
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isShowing = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(AppColors.onSurfaceVariant)
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, AppSpacing.md)
                
                // Logo & Welcome Message
                VStack(spacing: AppSpacing.md) {
                    ZStack {
                        Circle()
                            .fill(AppColors.surfaceContainerHigh)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "film.fill")
                            .font(.system(size: 36))
                            .foregroundColor(AppColors.primary)
                    }
                    
                    Text("Welcome to CineRate")
                        .font(AppFonts.headlineLarge)
                        .foregroundColor(AppColors.onSurface)
                        .multilineTextAlignment(.center)
                    
                    Text("Discover, rate, and share your favorite movies and TV shows")
                        .font(AppFonts.bodySmall)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, AppSpacing.lg)
                }
                .padding(.horizontal, AppSpacing.lg)
                
                // Sign In / Create Account Buttons
                VStack(spacing: AppSpacing.md) {
                    Button(action: {
                        print("Sign In tapped")
                    }) {
                        Text("Sign In")
                            .font(AppFonts.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(AppColors.primaryContainer)
                            .cornerRadius(AppRadius.md)
                    }
                    
                    Button(action: {
                        print("Create Account tapped")
                    }) {
                        Text("Create Account")
                            .font(AppFonts.body)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.primary)
                            .frame(maxWidth: .infinity)
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
            }
            .padding(.bottom, AppSpacing.xl)
            .background(AppColors.surfaceContainer)
            
            // Menu Items (Limited for non-logged in users)
            ScrollView {
                VStack(spacing: AppSpacing.sm) {
                    SidebarSectionHeader(title: "BROWSE")
                    
                    SidebarMenuItem(
                        icon: "house.fill",
                        title: "Home",
                        action: { print("Home tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "flame.fill",
                        title: "Trending",
                        action: { print("Trending tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "star.fill",
                        title: "Top Rated",
                        action: { print("Top Rated tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "film.fill",
                        title: "Movies",
                        action: { print("Movies tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "tv.fill",
                        title: "TV Shows",
                        action: { print("TV Shows tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "tag.fill",
                        title: "Browse Genres",
                        action: { print("Genres tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "magnifyingglass",
                        title: "Search",
                        action: { print("Search tapped") }
                    )
                    
                    // Info Section
                    SidebarSectionHeader(title: "INFO")
                        .padding(.top, AppSpacing.md)
                    
                    SidebarMenuItem(
                        icon: "questionmark.circle.fill",
                        title: "Help & Support",
                        action: { print("Help tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "info.circle.fill",
                        title: "About CineRate",
                        action: { print("About tapped") }
                    )
                    
                    SidebarMenuItem(
                        icon: "doc.text.fill",
                        title: "Terms & Privacy",
                        action: { print("Terms tapped") }
                    )
                }
                .padding(.top, AppSpacing.md)
            }
            
            Spacer()
            
            // Footer - App Version
            VStack(spacing: AppSpacing.sm) {
                Divider()
                    .background(AppColors.outlineVariant)
                
                Text("CineRate v1.0")
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .padding(.vertical, AppSpacing.md)
            }
            .background(AppColors.surfaceContainer)
        }
        .frame(width: 300)
        .background(AppColors.surface)
        .shadow(color: .black.opacity(0.3), radius: 20, x: -5, y: 0)
    }
}

// MARK: - Sidebar Supporting Components

/// Section Header for grouping menu items
struct SidebarSectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
            Spacer()
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.sm)
    }
}

/// Individual menu item with icon, title, and optional badge
struct SidebarMenuItem: View {
    let icon: String
    let title: String
    var badge: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 24)
                
                Text(title)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurface)
                
                Spacer()
                
                if let badge = badge {
                    Text(badge)
                        .font(AppFonts.label)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                        .padding(.horizontal, AppSpacing.sm)
                        .padding(.vertical, 4)
                        .background(AppColors.primaryContainer)
                        .cornerRadius(AppRadius.full)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.vertical, AppSpacing.md)
            .background(AppColors.surface)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// Quick stat item for sidebar header
struct SidebarStatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(AppFonts.body)
                .fontWeight(.bold)
                .foregroundColor(AppColors.primary)
            
            Text(label)
                .font(AppFonts.label)
                .foregroundColor(AppColors.onSurfaceVariant)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview
#Preview("Logged In Sidebar") {
    ZStack {
        AppColors.surface.ignoresSafeArea()
        
        Sidebar(isShowing: .constant(true), isLoggedIn: true)
    }
}

#Preview("Logged Out Sidebar") {
    ZStack {
        AppColors.surface.ignoresSafeArea()
        
        Sidebar(isShowing: .constant(true), isLoggedIn: false)
    }
}
