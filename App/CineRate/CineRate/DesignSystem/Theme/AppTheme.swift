// File Name: AppTheme.swift
// Folder: DesignSystem/Theme
import SwiftUI

protocol AppTheme {
    var colors: ThemeColors { get }
    var spacing: ThemeSpacing { get }
    var radius: ThemeRadius { get }
    var typography: ThemeTypography { get }
}

// Data structures to hold theme values
struct ThemeColors {
    let surface: Color
    let surfaceContainer: Color
    let surfaceContainerHigh: Color
    let surfaceContainerHighest: Color
    let primary: Color
    let primaryContainer: Color
    let outlineVariant: Color
    let onSurface: Color
    let onSurfaceVariant: Color
}

struct ThemeSpacing {
    let sm: CGFloat = 8
    let md: CGFloat = 16
    let lg: CGFloat = 24
    let xl: CGFloat = 32
    let xxl: CGFloat = 64
}

struct ThemeRadius {
    let md: CGFloat = 24
    let lg: CGFloat = 32
    let full: CGFloat = 999
}

struct ThemeTypography {
    let displayLarge: Font = .custom("Inter", size: 40)
    let headlineLarge: Font = .custom("Inter", size: 24)
    let body: Font = .custom("Inter", size: 16)
    let label: Font = .custom("Inter", size: 12)
}
