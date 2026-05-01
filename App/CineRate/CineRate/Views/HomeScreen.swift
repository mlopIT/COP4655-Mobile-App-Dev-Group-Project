// File Name: HomeScreen.swift
import SwiftUI
import Auth

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
    @StateObject private var mediaService = MediaService()
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @Binding var selectedTab: AppTab
    
    @State private var trendingMovies: [Media] = []
    @State private var trendingTVShows: [Media] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // 1. Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 2. The Header
                // We wrap it in another background that ignores the top safe area
                // This makes the black bar extend behind the Notch/Dynamic Island
                TopNavigationBar(showSidebar: $navigationCoordinator.showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                
                // We use a ScrollView to allow the Hero and Cards to coexist
                ScrollView {
                    VStack(spacing: 0) {
                        
                        // Hero section with real trending movie
                        if let heroMovie = trendingMovies.first {
                            MovieHeroView(movie: heroMovie)
                                .frame(height: 500)
                        } else if isLoading {
                            // Loading placeholder
                            ZStack {
                                AppColors.surfaceContainer
                                ProgressView()
                                    .tint(AppColors.primary)
                            }
                            .frame(height: 500)
                        } else {
                            // Error or empty state
                            MovieHeroView(movie: nil)
                                .frame(height: 500)
                        }
                        
                        // Trending TV Shows section with real data
                        TopRatedSection(tvShows: trendingTVShows, isLoading: isLoading)
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
            CustomNavigationBar(selectedTab: $selectedTab)
                // Ensure the theme is injected if using .glass() or theme tokens
                .environment(\.theme, DarkTheme())
            
            // Sidebar Overlay
            Sidebar(isShowing: $navigationCoordinator.showSidebar)
            }
            .task {
                await loadContent()
            }
    }
    
    // MARK: - Data Loading
    
    private func loadContent() async {
        isLoading = true
        errorMessage = nil
        
        do {
            // Get current user ID if authenticated
            let userId = authService.currentUser?.id
            
            // Load trending movies and TV shows in parallel for better performance
            async let movies = mediaService.getTrendingMovies(userId: userId)
            async let tvShows = mediaService.getTrendingTVShows(userId: userId)
            
            // Await both results
            trendingMovies = try await movies
            trendingTVShows = try await tvShows
            
            #if DEBUG
            print("✅ Loaded \(trendingMovies.count) trending movies")
            print("✅ Loaded \(trendingTVShows.count) trending TV shows")
            #endif
        } catch is CancellationError {
            // Task was cancelled (user navigated away), ignore silently
            #if DEBUG
            print("ℹ️ Content loading cancelled")
            #endif
        } catch {
            errorMessage = "Failed to load content: \(error.localizedDescription)"
            print("❌ Error loading home content: \(error)")
            
            // Set empty arrays on error to prevent crashes
            trendingMovies = []
            trendingTVShows = []
        }
        
        isLoading = false
    }
}
