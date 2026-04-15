import SwiftUI

struct TopNavigationBar: View {
    var body: some View {
        HStack {
            // Logo using the "displayMedium" or custom size if needed
            Text("CINERATE")
                .font(AppFonts.displayMedium)
                .tracking(2) // Adds letter spacing for that cinematic look
                .foregroundColor(AppColors.onSurface)
            
            Spacer()
            
            // Hamburger Menu Icon
            Button(action: {
                print("Menu tapped")
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
        .background(AppColors.surface) // The solid dark background
    }
}
