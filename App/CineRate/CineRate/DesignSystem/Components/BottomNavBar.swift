import SwiftUI

// MARK: - Tab Enum
enum AppTab: String, CaseIterable {
    case home = "HOME"
    case search = "SEARCH"
    case activity = "ACTIVITY"
    case profile = "PROFILE"
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .activity: return "bell"
        case .profile: return "person"
        }
    }
}

// MARK: - Custom Navigation Bar
struct CustomNavigationBar: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    VStack(spacing: AppSpacing.sm) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                        
                        Text(tab.rawValue)
                            .font(AppFonts.label)
                    }
                    .frame(maxWidth: .infinity)
                    // Highlight the active tab using Primary color
                    .foregroundColor(selectedTab == tab ? AppColors.primary : AppColors.onSurfaceVariant)
                }
            }
        }
        .padding(.vertical, AppSpacing.md)
        .padding(.horizontal, AppSpacing.lg)
        .background(AppColors.surfaceContainer)
        // Applies the 32pt rounding to the top corners as seen in Nav.png
        .cornerRadius(AppRadius.lg, corners: [.topLeft, .topRight])
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: -5)
    }
}

// MARK: - Main Tab Container (Use this as your root view)
struct MainTabContainer: View {
    @StateObject private var authService = AuthService()
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            ZStack(alignment: .bottom) {
                // Content based on selected tab
                Group {
                    switch selectedTab {
                    case .home:
                        HomeScreen(selectedTab: $selectedTab)
                    case .search:
                        SearchScreen(selectedTab: $selectedTab)
                    case .activity:
                        ActivityScreen(selectedTab: $selectedTab)
                    case .profile:
                        ProfileScreen(selectedTab: $selectedTab)
                    }
                }
                .environmentObject(authService)
                .environmentObject(navigationCoordinator)
                
                // Bottom Navigation Bar
                CustomNavigationBar(selectedTab: $selectedTab)
            }
            .navigationBarHidden(true)
            .navigationDestination(for: NavigationDestination.self) { destination in
                NavigationCoordinator.view(for: destination)
                    .environmentObject(authService)
                    .environmentObject(navigationCoordinator)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// Helper to allow specific corner rounding
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
