// File Name: AboutScreen.swift
import SwiftUI

struct AboutScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @State private var selectedTab: AppTab = .profile
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Top Navigation Bar
                AboutNavigationBar(showSidebar: $navigationCoordinator.showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content
                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        Spacer().frame(height: AppSpacing.xl)
                        
                        // App Icon & Name
                        VStack(spacing: AppSpacing.md) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(
                                        LinearGradient(
                                            colors: [AppColors.primary, AppColors.primaryContainer],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 100, height: 100)
                                    .shadow(color: AppColors.primary.opacity(0.3), radius: 20, x: 0, y: 10)
                                
                                Image(systemName: "film.fill")
                                    .font(.system(size: 48))
                                    .foregroundColor(.white)
                            }
                            
                            Text("CINERATE")
                                .font(AppFonts.displayMedium)
                                .tracking(2)
                                .foregroundColor(AppColors.onSurface)
                            
                            Text("Rate. Review. Discover.")
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            Text("Version 1.0.0 (Build 1001)")
                                .font(AppFonts.label)
                                .foregroundColor(AppColors.onSurfaceVariant)
                                .padding(.top, AppSpacing.sm)
                        }
                        
                        // App Description
                        VStack(spacing: AppSpacing.md) {
                            Text("Your ultimate companion for discovering, rating, and reviewing movies and TV shows. Connect with fellow cinephiles, share your opinions, and never miss a great film again.")
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurfaceVariant)
                                .multilineTextAlignment(.center)
                                .lineSpacing(6)
                                .padding(.horizontal, AppSpacing.xl)
                        }
                        
//                        // Stats
//                        HStack(spacing: AppSpacing.lg) {
//                            AboutStatCard(value: "1M+", label: "Users")
//                            AboutStatCard(value: "50K+", label: "Movies")
//                            AboutStatCard(value: "20K+", label: "TV Shows")
//                        }
//                        .padding(.horizontal, AppSpacing.lg)
//                        
//                        // What's New
//                        VStack(spacing: 0) {
//                            HStack {
//                                Text("WHAT'S NEW")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                                Spacer()
//                            }
//                            .padding(.horizontal, AppSpacing.lg)
//                            .padding(.bottom, AppSpacing.sm)
//                            
//                            VStack(alignment: .leading, spacing: AppSpacing.md) {
//                                WhatsNewItem(
//                                    icon: "sparkles",
//                                    title: "Redesigned Interface",
//                                    description: "Fresh new look with improved navigation and dark mode support"
//                                )
//                                
//                                WhatsNewItem(
//                                    icon: "person.2.fill",
//                                    title: "Social Features",
//                                    description: "Follow friends, see their ratings, and discuss movies together"
//                                )
//                                
//                                WhatsNewItem(
//                                    icon: "chart.bar.fill",
//                                    title: "Enhanced Stats",
//                                    description: "Track your viewing habits with detailed analytics and insights"
//                                )
//                                
//                                WhatsNewItem(
//                                    icon: "bell.badge.fill",
//                                    title: "Smart Notifications",
//                                    description: "Get notified about new releases from your favorite genres and actors"
//                                )
//                            }
//                            .padding(AppSpacing.md)
//                            .background(AppColors.surfaceContainer)
//                            .cornerRadius(AppRadius.md)
//                            .padding(.horizontal, AppSpacing.lg)
//                        }
//                        
//                        // Links Section
//                        VStack(spacing: 0) {
//                            HStack {
//                                Text("RESOURCES")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                                Spacer()
//                            }
//                            .padding(.horizontal, AppSpacing.lg)
//                            .padding(.bottom, AppSpacing.sm)
//                            
//                            VStack(spacing: AppSpacing.sm) {
//                                AboutLinkRow(
//                                    icon: "globe",
//                                    title: "Website",
//                                    subtitle: "www.cinerate.app",
//                                    action: { print("Website tapped") }
//                                )
//                                
//                                AboutLinkRow(
//                                    icon: "doc.text.fill",
//                                    title: "Privacy Policy",
//                                    subtitle: "How we protect your data",
//                                    action: { print("Privacy Policy tapped") }
//                                )
//                                
//                                AboutLinkRow(
//                                    icon: "doc.plaintext.fill",
//                                    title: "Terms of Service",
//                                    subtitle: "Terms and conditions",
//                                    action: { print("Terms tapped") }
//                                )
//                                
//                                AboutLinkRow(
//                                    icon: "book.fill",
//                                    title: "Open Source Licenses",
//                                    subtitle: "Third-party libraries and licenses",
//                                    action: { print("Licenses tapped") }
//                                )
//                                
//                                AboutLinkRow(
//                                    icon: "newspaper.fill",
//                                    title: "Release Notes",
//                                    subtitle: "Full changelog and version history",
//                                    action: { print("Release Notes tapped") }
//                                )
//                            }
//                            .padding(.horizontal, AppSpacing.lg)
//                        }
                        
                        // Team Section
                        VStack(spacing: 0) {
                            HStack {
                                Text("THE TEAM")
                                    .font(AppFonts.label)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                Spacer()
                            }
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.bottom, AppSpacing.sm)
                            
                            VStack(spacing: AppSpacing.md) {
                                Text("Made with ❤️ by movie lovers, for movie lovers")
                                    .font(AppFonts.body)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                    .multilineTextAlignment(.center)
                                
                                HStack(spacing: AppSpacing.lg) {
                                    TeamMemberCard(
                                        initials: "JD",
                                        name: "John Doe",
                                        role: "Founder & CEO"
                                    )
                                    
                                    TeamMemberCard(
                                        initials: "JS",
                                        name: "Jane Smith",
                                        role: "Head of Product"
                                    )
                                    
                                    TeamMemberCard(
                                        initials: "BJ",
                                        name: "Bob Johnson",
                                        role: "Lead Developer"
                                    )
                                }
                            }
                            .padding(AppSpacing.md)
                            .background(AppColors.surfaceContainer)
                            .cornerRadius(AppRadius.md)
                            .padding(.horizontal, AppSpacing.lg)
                        }
                        
//                        // Social Media
//                        VStack(spacing: 0) {
//                            HStack {
//                                Text("CONNECT WITH US")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                                Spacer()
//                            }
//                            .padding(.horizontal, AppSpacing.lg)
//                            .padding(.bottom, AppSpacing.sm)
//                            
//                            HStack(spacing: AppSpacing.md) {
//                                SocialButton(icon: "logo.twitter", color: Color(hex: "#1DA1F2"))
//                                SocialButton(icon: "logo.instagram", color: Color(hex: "#E4405F"))
//                                SocialButton(icon: "logo.facebook", color: Color(hex: "#4267B2"))
//                                SocialButton(icon: "envelope.fill", color: AppColors.primary)
//                            }
//                            .padding(.horizontal, AppSpacing.lg)
//                        }
//                        
//                        // Support
//                        VStack(spacing: AppSpacing.md) {
//                            HStack {
//                                Text("SUPPORT THE APP")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                                Spacer()
//                            }
//                            
//                            VStack(spacing: AppSpacing.md) {
//                                Button(action: {
//                                    print("Rate App tapped")
//                                }) {
//                                    HStack {
//                                        Image(systemName: "star.fill")
//                                            .foregroundColor(.yellow)
//                                        
//                                        Text("Rate CineRate on the App Store")
//                                            .font(AppFonts.body)
//                                            .fontWeight(.semibold)
//                                        
//                                        Spacer()
//                                        
//                                        Image(systemName: "arrow.right")
//                                            .font(.system(size: 14))
//                                    }
//                                    .foregroundColor(AppColors.onSurface)
//                                    .padding(AppSpacing.md)
//                                    .background(AppColors.surfaceContainer)
//                                    .cornerRadius(AppRadius.md)
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                                
//                                Button(action: {
//                                    print("Share App tapped")
//                                }) {
//                                    HStack {
//                                        Image(systemName: "square.and.arrow.up.fill")
//                                            .foregroundColor(AppColors.primary)
//                                        
//                                        Text("Share CineRate with Friends")
//                                            .font(AppFonts.body)
//                                            .fontWeight(.semibold)
//                                        
//                                        Spacer()
//                                        
//                                        Image(systemName: "arrow.right")
//                                            .font(.system(size: 14))
//                                    }
//                                    .foregroundColor(AppColors.onSurface)
//                                    .padding(AppSpacing.md)
//                                    .background(AppColors.surfaceContainer)
//                                    .cornerRadius(AppRadius.md)
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                            }
//                        }
//                        .padding(.horizontal, AppSpacing.lg)
//                        
//                        // Copyright
//                        VStack(spacing: AppSpacing.sm) {
//                            Divider()
//                                .background(AppColors.outlineVariant)
//                                .padding(.horizontal, AppSpacing.lg)
//                            
//                            VStack(spacing: 4) {
//                                Text("© 2026 CineRate, Inc.")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                                
//                                Text("All rights reserved")
//                                    .font(AppFonts.label)
//                                    .foregroundColor(AppColors.onSurfaceVariant)
//                            }
//                            .padding(.vertical, AppSpacing.md)
//                        }
                        
                        Spacer().frame(height: AppSpacing.xxl)
                    }
                }
                .background(AppColors.surface)
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $navigationCoordinator.showSidebar)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - Supporting Views

struct AboutNavigationBar: View {
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
            
            Text("About")
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

struct AboutStatCard: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
            Text(value)
                .font(AppFonts.headlineLarge)
                .fontWeight(.bold)
                .foregroundColor(AppColors.primary)
            
            Text(label)
                .font(AppFonts.bodySmall)
                .foregroundColor(AppColors.onSurfaceVariant)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, AppSpacing.lg)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
    }
}

struct WhatsNewItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.md) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(AppColors.primary)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(AppFonts.body)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.onSurface)
                
                Text(description)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .lineSpacing(4)
            }
            
            Spacer()
        }
    }
}

struct AboutLinkRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
                
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TeamMemberCard: View {
    let initials: String
    let name: String
    let role: String
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
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
                
                Text(initials)
                    .font(AppFonts.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 2) {
                Text(name)
                    .font(AppFonts.bodySmall)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.onSurface)
                
                Text(role)
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct SocialButton: View {
//    let icon: String
//    let color: Color
//    
//    var body: some View {
//        Button(action: {
//            print("\(icon) tapped")
//        }) {
//            ZStack {
//                Circle()
//                    .fill(color.opacity(0.2))
//                    .frame(width: 56, height: 56)
//                
//                // For social icons we'd use SF Symbols or custom icons
//                // Using fallback system icons here
//                let systemIcon = icon.replacingOccurrences(of: "logo.", with: "")
//                Image(systemName: systemIcon == "twitter" ? "at" : 
//                               systemIcon == "instagram" ? "camera" :
//                               systemIcon == "facebook" ? "f.square" :
//                               "envelope.fill")
//                    .font(.system(size: 20))
//                    .foregroundColor(color)
//            }
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//}

// MARK: - Preview

#Preview {
    AboutScreen()
}
