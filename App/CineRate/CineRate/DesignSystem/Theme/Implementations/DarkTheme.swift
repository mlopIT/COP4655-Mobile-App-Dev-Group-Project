// File Name: DarkTheme.swift
// Folder: DesignSystem/Theme/Implementations
import SwiftUI

struct DarkTheme: AppTheme {
    let colors = ThemeColors(
        surface: Color(hex: "#131315"),
        surfaceContainer: Color(hex: "#1f1f21"),
        surfaceContainerHigh: Color(hex: "#2a2a2c"),
        surfaceContainerHighest: Color(hex: "#353437"),
        primary: Color(hex: "#abc7ff"),
        primaryContainer: Color(hex: "#0071e3"),
        outlineVariant: Color(hex: "#414753"),
        onSurface: .white,
        onSurfaceVariant: .gray
    )
    
    let spacing = ThemeSpacing()
    let radius = ThemeRadius()
    let typography = ThemeTypography()
}
