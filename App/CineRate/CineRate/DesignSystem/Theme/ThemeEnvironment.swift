// File Name: ThemeEnvironment.swift
// Folder: DesignSystem/Theme
import SwiftUI

struct ThemeKey: EnvironmentKey {
    static let defaultValue: AppTheme = DarkTheme()
}

extension EnvironmentValues {
    var theme: AppTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
