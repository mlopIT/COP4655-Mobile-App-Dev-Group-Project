// File Name: LoggedInProfileScreen.swift
import SwiftUI

struct LoggedInProfileScreen: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @State private var showSidebar = false
    @State private var selectedTab: AppTab = .profile
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Navigation Bar
                TopNavigationBar(showSidebar: $showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content Area
                ScrollView {
                    VStack(spacing: AppSpacing.lg) {
                        // Profile Header Section
                        ProfileHeaderView()
                            .padding(.top, AppSpacing.xl)
                        
                        // Stats Section
                        ProfileStatsView()
                            .padding(.horizontal, AppSpacing.lg)
                        
                        // Quick Actions
                        VStack(spacing: AppSpacing.md) {
                            ProfileMenuItem(
                                icon: "star.fill",
                                title: "My Ratings",
                                subtitle: "View all your ratings"
                            )
                            
                            ProfileMenuItem(
                                icon: "bookmark.fill",
                                title: "Watchlist",
                                subtitle: "Movies and shows to watch"
                            )
                            
                            ProfileMenuItem(
                                icon: "heart.fill",
                                title: "Favorites",
                                subtitle: "Your favorite content"
                            )
                            
                            ProfileMenuItem(
                                icon: "clock.fill",
                                title: "Watch History",
                                subtitle: "Recently watched"
                            )
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        .padding(.top, AppSpacing.md)
                        
                        // Settings Section
                        VStack(alignment: .leading, spacing: AppSpacing.md) {
                            Text("SETTINGS")
                                .font(AppFonts.label)
                                .foregroundColor(AppColors.onSurfaceVariant)
                                .padding(.horizontal, AppSpacing.lg)
                            
                            VStack(spacing: AppSpacing.md) {
                                ProfileMenuItem(
                                    icon: "gearshape.fill",
                                    title: "Preferences",
                                    subtitle: "App settings and preferences"
                                )
                                
                                ProfileMenuItem(
                                    icon: "bell.fill",
                                    title: "Notifications",
                                    subtitle: "Manage notifications"
                                )
                                
                                ProfileMenuItem(
                                    icon: "lock.fill",
                                    title: "Privacy & Security",
                                    subtitle: "Manage your privacy"
                                )
                                
                                ProfileMenuItem(
                                    icon: "questionmark.circle.fill",
                                    title: "Help & Support",
                                    subtitle: "Get help and feedback"
                                )
                            }
                            .padding(.horizontal, AppSpacing.lg)
                        }
                        .padding(.top, AppSpacing.lg)
                        
                        // Sign Out Button
                        Button(action: {
                            print("Sign Out tapped")
                        }) {
                            Text("Sign Out")
                                .font(AppFonts.body)
                                .fontWeight(.semibold)
                                .foregroundColor(AppColors.primary)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(AppColors.surfaceContainerHigh)
                                .cornerRadius(AppRadius.md)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppRadius.md)
                                        .stroke(AppColors.outlineVariant, lineWidth: 1)
                                )
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        .padding(.top, AppSpacing.xl)
                        
                        Spacer()
                            .frame(height: AppSpacing.xxl)
                    }
                }
                .background(AppColors.surface)
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $showSidebar)
        }
    }
}

// MARK: - Profile Header View
struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: AppSpacing.md) {
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
                    .frame(width: 100, height: 100)
                
                // You can replace this with an actual image:
                // AsyncImage(url: URL(string: "profile_image_url")) or Image("profile")
                Text("JD")
                    .font(AppFonts.displayMedium)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .overlay(
                Circle()
                    .stroke(AppColors.surface, lineWidth: 4)
            )
            
            // User Name
            Text("John Doe")
                .font(AppFonts.headlineLarge)
                .foregroundColor(AppColors.onSurface)
            
            // Username/Handle
            Text("@johndoe")
                .font(AppFonts.body)
                .foregroundColor(AppColors.onSurfaceVariant)
            
            // Bio/Description
            Text("Film enthusiast • Critic • Weekend binge watcher")
                .font(AppFonts.bodySmall)
                .foregroundColor(AppColors.onSurfaceVariant)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.xl)
            
            // Edit Profile Button
            Button(action: {
                print("Edit Profile tapped")
            }) {
                HStack(spacing: AppSpacing.sm) {
                    Image(systemName: "pencil")
                        .font(.system(size: 14))
                    Text("Edit Profile")
                        .font(AppFonts.bodySmall)
                        .fontWeight(.semibold)
                }
                .foregroundColor(AppColors.onSurface)
                .padding(.horizontal, AppSpacing.lg)
                .padding(.vertical, AppSpacing.sm)
                .background(AppColors.surfaceContainerHigh)
                .cornerRadius(AppRadius.full)
                .overlay(
                    RoundedRectangle(cornerRadius: AppRadius.full)
                        .stroke(AppColors.outlineVariant, lineWidth: 1)
                )
            }
            .padding(.top, AppSpacing.sm)
        }
    }
}

// MARK: - Profile Stats View
struct ProfileStatsView: View {
    var body: some View {
        HStack(spacing: 0) {
            StatItemView(number: "147", label: "Ratings")
            
            Divider()
                .frame(height: 40)
                .background(AppColors.outlineVariant)
            
            StatItemView(number: "32", label: "Reviews")
            
            Divider()
                .frame(height: 40)
                .background(AppColors.outlineVariant)
            
            StatItemView(number: "89", label: "Watchlist")
        }
        .padding(.vertical, AppSpacing.lg)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
    }
}

struct StatItemView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
            Text(number)
                .font(AppFonts.headlineLarge)
                .fontWeight(.bold)
                .foregroundColor(AppColors.primary)
            
            Text(label)
                .font(AppFonts.bodySmall)
                .foregroundColor(AppColors.onSurfaceVariant)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Profile Menu Item
struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Button(action: {
            print("\(title) tapped")
        }) {
            HStack(spacing: AppSpacing.md) {
                // Icon
                ZStack {
                    Circle()
                        .fill(AppColors.surfaceContainerHigh)
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(AppColors.primary)
                }
                
                // Text Content
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.bodySmall)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
                
                // Chevron
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Preview
#Preview {
    LoggedInProfileScreen()
}
