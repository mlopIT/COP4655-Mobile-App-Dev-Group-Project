// File Name: NotLoggedInProfileScreen.swift
import SwiftUI

struct NotLoggedInProfileScreen: View {
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
                    VStack(spacing: AppSpacing.xl) {
                        Spacer()
                            .frame(height: AppSpacing.xxl)
                        
                        // Profile Icon
                        ZStack {
                            Circle()
                                .fill(AppColors.surfaceContainerHigh)
                                .frame(width: 120, height: 120)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 50))
                                .foregroundColor(AppColors.onSurfaceVariant)
                        }
                        
                        // Title
                        Text("Sign in to CineRate")
                            .font(AppFonts.headlineLarge)
                            .foregroundColor(AppColors.onSurface)
                            .multilineTextAlignment(.center)
                        
                        // Description
                        Text("Create an account or sign in to start rating and sharing your thoughts with the community.")
                            .font(AppFonts.body)
                            .foregroundColor(AppColors.onSurfaceVariant)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, AppSpacing.xl)
                            .lineSpacing(4)
                        
                        Spacer()
                            .frame(height: AppSpacing.md)
                        
                        // Sign In Button
                        Button(action: {
                            print("Sign In tapped")
                        }) {
                            Text("Sign In")
                                .font(AppFonts.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(AppColors.primaryContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Create Account Button
                        Button(action: {
                            print("Create Account tapped")
                        }) {
                            Text("Create Account")
                                .font(AppFonts.title)
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
                        
                        // Continue as Guest
                        Button(action: {
                            print("Continue as Guest tapped")
                        }) {
                            Text("Continue as Guest")
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurfaceVariant)
                                .underline()
                        }
                        .padding(.top, AppSpacing.md)
                        
                        Spacer()
                            .frame(height: AppSpacing.xxl)
                    }
                }
                .background(AppColors.surface)
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $showSidebar, isLoggedIn: false)
        }
    }
}

// Preview
#Preview {
    NotLoggedInProfileScreen()
}
