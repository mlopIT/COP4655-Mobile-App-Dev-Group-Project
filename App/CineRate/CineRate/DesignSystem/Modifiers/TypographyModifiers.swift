import SwiftUI

extension View {
    func displayLarge() -> some View {
        self.font(AppFonts.displayLarge)
            .tracking(-0.02)
            .foregroundColor(AppColors.onSurface)
    }
    
    func headline() -> some View {
        self.font(AppFonts.headlineLarge)
            .foregroundColor(AppColors.onSurface)
    }
    
    func bodyText() -> some View {
        self.font(AppFonts.body)
            .foregroundColor(AppColors.onSurfaceVariant)
    }
    
    func label() -> some View {
        self.font(AppFonts.label)
            .tracking(0.05)
            .textCase(.uppercase)
    }
}
