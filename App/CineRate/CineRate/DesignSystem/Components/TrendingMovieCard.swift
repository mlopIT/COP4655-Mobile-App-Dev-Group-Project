// How to use this component:
// Ensure TrendingMovieCard.swift is in your project.
// MovieHeroView()
//    .frame(height: 500) // Defining the height for the preview layout


import SwiftUI

struct MovieHeroView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 1. Background Image
            Image("film image") // Replace with your asset name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()

            // 2. Gradient Overlay for Text Readability
//            LinearGradient(
//                gradient: Gradient(colors: [.clear, AppColors.surface.opacity(0.8), AppColors.surface]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()

            // 3. Content Layer
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                
                // Trending Tag (Using Glass Style)
                HStack(spacing: AppSpacing.sm) {
                    Text("TRENDING MOVIES")
                        .font(AppFonts.label)
                        .foregroundColor(.white)
                    Circle()
                        .fill(Color.purple) // Accent dot
                        .frame(width: 6, height: 6)
                }
                .padding(.horizontal, AppSpacing.md)
                .padding(.vertical, AppSpacing.sm)
                .background(.ultraThinMaterial)
                .cornerRadius(AppRadius.full)
                
                Spacer()

                // Movie Title
                Text("MOVIE NAME\nPLACEHOLDER")
                    .displayLarge() // Uses Inter 40pt
                    .lineLimit(2)
                
                // Action Button
                Button(action: {
                    print("Details tapped")
                }) {
                    Text("SEE DETAILS")
                        .frame(maxWidth: .infinity) // Makes it wide like the design
                }
                .buttonStyle(PrimaryButtonStyle()) // Uses your gradient style
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, AppSpacing.xl)
            .padding(.bottom, AppSpacing.xxl) // Extra space at bottom
        }
    }
}
