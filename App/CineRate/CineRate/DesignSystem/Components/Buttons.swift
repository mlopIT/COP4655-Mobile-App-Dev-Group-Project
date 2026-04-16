import SwiftUI

// Note: PrimaryButtonStyle, SecondaryButtonStyle, and IconButtonStyle 
// are now defined in ButtonStyles.swift

struct GlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                AppColors.surfaceContainer.opacity(0.2)
            )
            .background(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.full)
                    .stroke(AppColors.outlineVariant.opacity(0.15), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}
