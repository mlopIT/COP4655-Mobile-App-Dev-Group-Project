import SwiftUI
import Auth

struct SearchScreenView: View {
    @StateObject private var mediaService = MediaService()
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    var selectedTab: Binding<AppTab>?
    
    @State private var searchText = ""
    @State private var searchResults: [Media] = []
    @State private var isSearching = false
    @FocusState private var isSearchFieldFocused: Bool
    
    // Debounce timer
    @State private var searchTask: Task<Void, Never>?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // 1. Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 2. Top Navigation Bar
                TopNavigationBar(showSidebar: $navigationCoordinator.showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // 3. Search Content
                ScrollView {
                    VStack(spacing: 0) {
                        
                        // Search Header Section
                        SearchHeaderSection(searchText: $searchText, isSearchFieldFocused: $isSearchFieldFocused)
                            .padding(.top, AppSpacing.lg)
                        
                        // Conditional Content
                        if searchText.isEmpty {
                            // Show popular searches when no search text
                            PopularSearchesSection(onSearchTap: { query in
                                searchText = query
                            })
                            .padding(.top, AppSpacing.xl)
                        } else {
                            // Show search results
                            SearchResultsSection(
                                searchQuery: searchText,
                                results: searchResults,
                                isSearching: isSearching
                            )
                            .padding(.top, AppSpacing.lg)
                        }
                    }
                    .padding(.bottom, isSearchFieldFocused ? 20 : 100) // Adjust bottom padding based on keyboard state
                }
                // Tap to dismiss keyboard
                .contentShape(Rectangle())
                .onTapGesture {
                    isSearchFieldFocused = false
                }
            }
            
            // 4. Bottom Navigation Bar - Hidden when keyboard is visible
            if !isSearchFieldFocused {
                if let selectedTab = selectedTab {
                    CustomNavigationBar(selectedTab: selectedTab)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            
            // Sidebar
            Sidebar(isShowing: $navigationCoordinator.showSidebar)
        }
        .animation(.easeInOut(duration: 0.3), value: isSearchFieldFocused)
        .onChange(of: searchText) { newValue in
            performSearch(query: newValue)
        }
    }
    
    // MARK: - Search Logic
    
    private func performSearch(query: String) {
        // Cancel previous search task
        searchTask?.cancel()
        
        // Clear results if query is empty
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchResults = []
            return
        }
        
        // Debounce search - wait 0.5 seconds before searching
        searchTask = Task {
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
            
            guard !Task.isCancelled else { return }
            
            await executeSearch(query: query)
        }
    }
    
    @MainActor
    private func executeSearch(query: String) async {
        isSearching = true
        
        do {
            let userId = authService.currentUser?.id
            
            // Use multi-search to get both movies and TV shows
            searchResults = try await mediaService.multiSearch(
                query: query,
                userId: userId,
                page: 1
            )
            
            #if DEBUG
            print("✅ Found \(searchResults.count) results for: \(query)")
            #endif
            
            // Store recent search only if results found
            if !searchResults.isEmpty {
                RecentSearchManager.shared.addSearch(query)
            }
            
        } catch {
            print("❌ Search error: \(error.localizedDescription)")
            searchResults = []
        }
        
        isSearching = false
    }
}

// MARK: - Recent Search Manager

class RecentSearchManager {
    static let shared = RecentSearchManager()
    
    private let userDefaultsKey = "recentSearches"
    private let maxSearches = 10
    
    private init() {}
    
    func getRecentSearches() -> [String] {
        return UserDefaults.standard.stringArray(forKey: userDefaultsKey) ?? []
    }
    
    func addSearch(_ query: String) {
        var searches = getRecentSearches()
        
        // Remove if already exists
        searches.removeAll { $0.lowercased() == query.lowercased() }
        
        // Add to front
        searches.insert(query, at: 0)
        
        // Keep only max number of searches
        if searches.count > maxSearches {
            searches = Array(searches.prefix(maxSearches))
        }
        
        UserDefaults.standard.set(searches, forKey: userDefaultsKey)
    }
    
    func removeSearch(_ query: String) {
        var searches = getRecentSearches()
        searches.removeAll { $0 == query }
        UserDefaults.standard.set(searches, forKey: userDefaultsKey)
    }
    
    func clearAll() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}

// MARK: - Preview
struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenPreviewWrapper()
    }
    
    struct SearchScreenPreviewWrapper: View {
        @State private var selectedTab: AppTab = .home
        
        var body: some View {
            SearchScreenView(selectedTab: $selectedTab)
                .environmentObject(AuthService())
        }
    }
}

// Note: SearchScreen is now defined in SearchScreenView.swift
// This file contains the alternative SearchScreenView implementation

