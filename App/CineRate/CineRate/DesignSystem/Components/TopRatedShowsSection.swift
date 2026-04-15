import SwiftUI

struct TopRatedSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            
            // Header Row
            HStack(alignment: .firstTextBaseline) {
                Text("TRENDING TV SHOWS")
                    .headline() // Applies Inter 24pt, Bold, and White
                
                Spacer()
                
                Button(action: {
                    print("View All Tapped")
                }) {
                    Text("VIEW ALL")
                        .font(AppFonts.label)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            // Horizontal Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: AppSpacing.md) {
                    // Placeholder Data
                    TrendingCard(title: "Daredevil: Born Again", genres: "Superhero / Crime / Thriller", rating: "8.6", imageName: "daredevil")
                    TrendingCard(title: "The Penguin", genres: "Crime / Drama", rating: "8.8", imageName: "penguin")
                    TrendingCard(title: "Andor", genres: "Sci-Fi / Action", rating: "8.4", imageName: "andor")
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.bottom, AppSpacing.lg) // Space for the shadow
            }
        }
    }
}
