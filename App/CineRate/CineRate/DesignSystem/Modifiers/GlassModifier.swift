// File Name: ThemeModifiers.swift
// Folder: DesignSystem/Modifiers
import SwiftUI

struct GlassModifier: ViewModifier {
    @Environment(\.theme) var theme
    var opacity: Double = 0.7
    
    func body(content: Content) -> some View {
        content
            .background(
                theme.colors.surfaceContainer
                    .opacity(opacity)
                    .background(.ultraThinMaterial)
            )
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.lg)
                    .stroke(theme.colors.outlineVariant.opacity(0.15), lineWidth: 1)
            )
    }
}

extension View {
    func glass() -> some View {
        modifier(GlassModifier())
    }
    
    func glassCardStyle() -> some View {
        self.padding(16) // Use a theme value if preferred
            .background(ThemeKey.defaultValue.colors.surfaceContainer)
            .cornerRadius(ThemeKey.defaultValue.radius.lg)
    }
}
