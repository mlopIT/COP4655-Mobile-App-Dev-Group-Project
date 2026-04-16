import SwiftUI

struct SearchScreenView: View {
    @State private var searchText = ""
    @FocusState private var isSearchFieldFocused: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // 1. Global Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 2. Top Navigation Bar
                TopNavigationBar()
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
                            PopularSearchesSection()
                                .padding(.top, AppSpacing.xl)
                        } else {
                            // Show search results
                            SearchResultsSection(searchQuery: searchText)
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
                CustomNavigationBar()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isSearchFieldFocused)
    }
}

// MARK: - Preview
#Preview {
    SearchScreenView()
}
