// File Name: SearchScreen.swift
import SwiftUI
import Auth

struct SearchScreen: View {
    @Binding var selectedTab: AppTab
    @EnvironmentObject var authService: AuthService
    @StateObject private var mediaService = MediaService()
    
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool
    @State private var searchResults: [Media] = []
    @State private var isSearching = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                TopNavigationBar(showSidebar: .constant(false))
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content
                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        
                        // Search Header with Search Bar
                        SearchHeaderSection(
                            searchText: $searchText,
                            isSearchFieldFocused: $isSearchFieldFocused
                        )
                        .padding(.top, AppSpacing.lg)
                        
                        // Show different content based on search state
                        if searchText.isEmpty {
                            // Show popular searches when not searching
                            PopularSearchesSection { searchQuery in
                                searchText = searchQuery
                                performSearch()
                            }
                        } else {
                            // Show search results
                            SearchResultsSection(
                                searchQuery: searchText,
                                results: searchResults,
                                isSearching: isSearching
                            )
                        }
                    }
                    .padding(.bottom, 100) // Space for bottom nav
                }
            }
        }
        .onChange(of: searchText) { newValue in
            if !newValue.isEmpty {
                // Debounce search
                Task {
                    try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
                    if newValue == searchText {
                        performSearch()
                    }
                }
            } else {
                searchResults = []
                isSearching = false
            }
        }
    }
    
    // MARK: - Search Logic
    
    private func performSearch() {
        guard !searchText.isEmpty else {
            searchResults = []
            isSearching = false
            return
        }
        
        isSearching = true
        
        // Save to recent searches
        RecentSearchManager.shared.addSearch(searchText)
        
        // Capture the current search text to compare later
        let currentSearchText = searchText
        
        Task {
            do {
                let userId = authService.currentUser?.id
                let results = try await mediaService.multiSearch(query: currentSearchText, userId: userId)
                
                // Only update if search text hasn't changed
                if currentSearchText == searchText {
                    await MainActor.run {
                        searchResults = results
                        isSearching = false
                    }
                }
                
                #if DEBUG
                print("✅ Found \(results.count) results for '\(currentSearchText)'")
                #endif
            } catch is CancellationError {
                #if DEBUG
                print("ℹ️ Search cancelled")
                #endif
            } catch {
                await MainActor.run {
                    searchResults = []
                    isSearching = false
                }
                
                #if DEBUG
                print("❌ Search error: \(error)")
                #endif
            }
        }
    }
}

// MARK: - Preview

#Preview {
    struct PreviewWrapper: View {
        @State var selectedTab: AppTab = .search
        
        var body: some View {
            SearchScreen(selectedTab: $selectedTab)
                .environmentObject(AuthService())
        }
    }
    
    return PreviewWrapper()
}
