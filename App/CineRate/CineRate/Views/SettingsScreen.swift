// File Name: SettingsScreen.swift
import SwiftUI

struct SettingsScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSidebar = false
    @State private var selectedTab: AppTab = .profile
    
    // Settings State
    @State private var notificationsEnabled = true
    @State private var emailNotifications = true
    @State private var pushNotifications = true
    @State private var reviewReminders = false
    
    @State private var darkModeEnabled = true
    @State private var autoPlayTrailers = false
    @State private var highQualityImages = true
    
    @State private var privacyProfile = PrivacyLevel.friends
    @State private var showRatings = true
    @State private var showWatchlist = false
    
    @State private var language = "English"
    @State private var region = "United States"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background color to fill entire screen
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Navigation Bar
                SettingsNavigationBar(showSidebar: $showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content
                ScrollView {
                    VStack(spacing: AppSpacing.lg) {
                        Spacer().frame(height: AppSpacing.md)
                        
                        // Account Section
                        SettingsSection(title: "ACCOUNT") {
                            SettingsNavigationRow(
                                icon: "person.circle.fill",
                                title: "Edit Profile",
                                subtitle: "Update your profile information",
                                action: { print("Edit Profile tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "lock.circle.fill",
                                title: "Password & Security",
                                subtitle: "Change password, enable 2FA",
                                action: { print("Password & Security tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "creditcard.circle.fill",
                                title: "Subscription",
                                subtitle: "Free Plan",
                                badge: "Upgrade",
                                action: { print("Subscription tapped") }
                            )
                        }
                        
                        // Notifications Section
                        SettingsSection(title: "NOTIFICATIONS") {
                            SettingsToggleRow(
                                icon: "bell.circle.fill",
                                title: "Enable Notifications",
                                subtitle: "Receive notifications from CineRate",
                                isOn: $notificationsEnabled
                            )
                            
                            if notificationsEnabled {
                                SettingsToggleRow(
                                    icon: "envelope.circle.fill",
                                    title: "Email Notifications",
                                    subtitle: "Get updates via email",
                                    isOn: $emailNotifications,
                                    indented: true
                                )
                                
                                SettingsToggleRow(
                                    icon: "app.badge.circle.fill",
                                    title: "Push Notifications",
                                    subtitle: "Get push notifications",
                                    isOn: $pushNotifications,
                                    indented: true
                                )
                                
                                SettingsToggleRow(
                                    icon: "clock.circle.fill",
                                    title: "Review Reminders",
                                    subtitle: "Remind me to review watched content",
                                    isOn: $reviewReminders,
                                    indented: true
                                )
                            }
                        }
                        
                        // Appearance Section
                        SettingsSection(title: "APPEARANCE") {
                            SettingsToggleRow(
                                icon: "moon.circle.fill",
                                title: "Dark Mode",
                                subtitle: "Use dark theme",
                                isOn: $darkModeEnabled
                            )
                            
                            SettingsToggleRow(
                                icon: "play.circle.fill",
                                title: "Auto-Play Trailers",
                                subtitle: "Automatically play video previews",
                                isOn: $autoPlayTrailers
                            )
                            
                            SettingsToggleRow(
                                icon: "photo.circle.fill",
                                title: "High Quality Images",
                                subtitle: "Use more data for better images",
                                isOn: $highQualityImages
                            )
                        }
                        
                        // Privacy Section
                        SettingsSection(title: "PRIVACY") {
                            SettingsPickerRow(
                                icon: "eye.circle.fill",
                                title: "Profile Visibility",
                                subtitle: privacyProfile.rawValue,
                                action: { print("Profile Visibility tapped") }
                            )
                            
                            SettingsToggleRow(
                                icon: "star.circle.fill",
                                title: "Show My Ratings",
                                subtitle: "Let others see what you've rated",
                                isOn: $showRatings
                            )
                            
                            SettingsToggleRow(
                                icon: "bookmark.circle.fill",
                                title: "Show My Watchlist",
                                subtitle: "Let others see your watchlist",
                                isOn: $showWatchlist
                            )
                            
                            SettingsNavigationRow(
                                icon: "hand.raised.circle.fill",
                                title: "Blocked Users",
                                subtitle: "Manage blocked accounts",
                                action: { print("Blocked Users tapped") }
                            )
                        }
                        
                        // General Section
                        SettingsSection(title: "GENERAL") {
                            SettingsPickerRow(
                                icon: "globe.circle.fill",
                                title: "Language",
                                subtitle: language,
                                action: { print("Language tapped") }
                            )
                            
                            SettingsPickerRow(
                                icon: "mappin.circle.fill",
                                title: "Region",
                                subtitle: region,
                                action: { print("Region tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "arrow.down.circle.fill",
                                title: "Downloads",
                                subtitle: "Manage offline content",
                                action: { print("Downloads tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "externaldrive.circle.fill",
                                title: "Storage & Cache",
                                subtitle: "Clear cache and manage storage",
                                action: { print("Storage tapped") }
                            )
                        }
                        
                        // Support Section
                        SettingsSection(title: "SUPPORT") {
                            SettingsNavigationRow(
                                icon: "questionmark.circle.fill",
                                title: "Help & Support",
                                subtitle: "Get help and contact support",
                                action: { print("Help tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "info.circle.fill",
                                title: "About CineRate",
                                subtitle: "Version, legal information",
                                action: { print("About tapped") }
                            )
                            
                            SettingsNavigationRow(
                                icon: "doc.text.circle.fill",
                                title: "Terms & Privacy Policy",
                                subtitle: "Read our terms and privacy policy",
                                action: { print("Terms tapped") }
                            )
                        }
                        
                        // Danger Zone
                        SettingsSection(title: "DANGER ZONE") {
                            SettingsActionRow(
                                icon: "exclamationmark.triangle.fill",
                                title: "Clear All Data",
                                subtitle: "Remove all local data",
                                destructive: false,
                                action: { print("Clear Data tapped") }
                            )
                            
                            SettingsActionRow(
                                icon: "trash.circle.fill",
                                title: "Delete Account",
                                subtitle: "Permanently delete your account",
                                destructive: true,
                                action: { print("Delete Account tapped") }
                            )
                        }
                        
                        Spacer().frame(height: AppSpacing.xxl)
                    }
                    .padding(.horizontal, AppSpacing.lg)
                }
                .background(AppColors.surface)
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $showSidebar, isLoggedIn: true)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - Supporting Views

struct SettingsNavigationBar: View {
    @Binding var showSidebar: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 44, height: 44)
            }
            
            Text("Settings")
                .font(AppFonts.headlineLarge)
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
        .background(AppColors.surface)
    }
}

struct SettingsSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .padding(.horizontal, AppSpacing.md)
                    .padding(.vertical, AppSpacing.sm)
                Spacer()
            }
            
            VStack(spacing: 0) {
                content
            }
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
    }
}

struct SettingsNavigationRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var badge: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
                
                if let badge = badge {
                    Text(badge)
                        .font(AppFonts.label)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, AppSpacing.sm)
                        .padding(.vertical, 4)
                        .background(AppColors.primaryContainer)
                        .cornerRadius(AppRadius.md)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, AppSpacing.md)
        }
        .buttonStyle(PlainButtonStyle())
        
        Divider()
            .background(AppColors.outlineVariant.opacity(0.3))
            .padding(.leading, 56)
    }
}

struct SettingsToggleRow: View {
    let icon: String
    let title: String
    let subtitle: String
    @Binding var isOn: Bool
    var indented: Bool = false
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            if indented {
                Spacer().frame(width: 16)
            }
            
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(AppColors.primary)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurface)
                
                Text(subtitle)
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(AppColors.primaryContainer)
        }
        .padding(.horizontal, AppSpacing.md)
        .padding(.vertical, AppSpacing.md)
        
        Divider()
            .background(AppColors.outlineVariant.opacity(0.3))
            .padding(.leading, indented ? 72 : 56)
    }
}

struct SettingsPickerRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.primary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, AppSpacing.md)
        }
        .buttonStyle(PlainButtonStyle())
        
        Divider()
            .background(AppColors.outlineVariant.opacity(0.3))
            .padding(.leading, 56)
    }
}

struct SettingsActionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var destructive: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(destructive ? .red : AppColors.primary)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .foregroundColor(destructive ? .red : AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
            }
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, AppSpacing.md)
        }
        .buttonStyle(PlainButtonStyle())
        
        Divider()
            .background(AppColors.outlineVariant.opacity(0.3))
            .padding(.leading, 56)
    }
}

// MARK: - Supporting Types

enum PrivacyLevel: String {
    case everyone = "Everyone"
    case friends = "Friends Only"
    case nobody = "Only Me"
}

// MARK: - Preview

#Preview {
    SettingsScreen()
}
