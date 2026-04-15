import SwiftUI

struct CustomNavigationBar: View {
    @State private var selectedTab = "HOME"
    
    // Define the tabs based on your image
    let tabs = [
        ("house", "HOME"),
        ("magnifyingglass", "SEARCH"),
        ("bell", "ACTIVITY"),
        ("person", "PROFILE")
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.1) { icon, name in
                Button(action: { selectedTab = name }) {
                    VStack(spacing: AppSpacing.sm) {
                        Image(systemName: icon)
                            .font(.system(size: 20))
                        
                        Text(name)
                            .font(AppFonts.label)
                    }
                    .frame(maxWidth: .infinity)
                    // Highlight the active tab using Primary color
                    .foregroundColor(selectedTab == name ? AppColors.primary : AppColors.onSurfaceVariant)
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
