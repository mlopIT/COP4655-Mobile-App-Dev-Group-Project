import SwiftUI

// MARK: - Primary Button Style (Gradient)
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFonts.body)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        AppColors.primaryContainer,
                        AppColors.primary
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(AppRadius.md)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Secondary Button Style (Outlined)
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppFonts.body)
            .fontWeight(.semibold)
            .foregroundColor(AppColors.primary)
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(AppColors.surfaceContainerHigh)
            .cornerRadius(AppRadius.md)
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.md)
                    .stroke(AppColors.outlineVariant, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Icon Button Style (Compact with Glass Effect)
struct IconButtonStyle: ButtonStyle {
    var backgroundColor: Color = AppColors.surfaceContainerHigh
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(AppColors.onSurface)
            .frame(width: 48, height: 48)
            .background(backgroundColor)
            .cornerRadius(AppRadius.md)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
