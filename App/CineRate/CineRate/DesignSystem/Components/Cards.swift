import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(AppSpacing.lg)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.lg)
    }
}

extension View {
    func solidCardStyle() -> some View {
        modifier(CardModifier())
    }
}
