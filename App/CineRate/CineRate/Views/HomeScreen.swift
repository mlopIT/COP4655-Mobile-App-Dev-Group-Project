// File Name: HomeScreen.swift
import SwiftUI

// 1. Minimal LightTheme implementation to prevent compiler errors
struct LightTheme: AppTheme {
    let colors = ThemeColors(
        surface: Color.white,
        surfaceContainer: Color(white: 0.95),
        surfaceContainerHigh: Color(white: 0.90),
        surfaceContainerHighest: Color(white: 0.85),
        primary: Color(hex: "#0071e3"),
        primaryContainer: Color(hex: "#abc7ff"),
        outlineVariant: Color.gray.opacity(0.2),
        onSurface: .black,
        onSurfaceVariant: .gray
    )
    
    let spacing = ThemeSpacing()
    let radius = ThemeRadius()
    let typography = ThemeTypography()
}

struct HomeScreen: View {
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            // 1. Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 2. The Header
                // We wrap it in another background that ignores the top safe area
                // This makes the black bar extend behind the Notch/Dynamic Island
                TopNavigationBar()
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                
                // We use a ScrollView to allow the Hero and Cards to coexist
                ScrollView {
                    VStack(spacing: 0) {
                        
                        // Ensure MovieHeroView.swift is in your project.
                        MovieHeroView()
                            .frame(height: 500) // Defining the height for the preview layout
                        
                        // We add vertical padding so it doesn't touch the hero image
                        TopRatedSection()
                            .padding(.vertical, AppSpacing.xl)
                        
                        // 3. Explore Genres Section
                        ExploreGenresSection()
                            .padding(.bottom, AppSpacing.xl)
                            .padding(.bottom, AppSpacing.xl)
                    }
                    .ignoresSafeArea(edges: .top) // Essential for the Hero to reach the top
                    .background(AppColors.surface)
                    
                }
            }
            
            // 3. The Navigation Layer - Now pinned to bottom of ZStack
            CustomNavigationBar()
                // Ensure the theme is injected if using .glass() or theme tokens
                .environment(\.theme, DarkTheme())
        }
    }
}
