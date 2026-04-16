// File Name: ViewExtensions.swift
import SwiftUI

// MARK: - Text Modifiers
extension Text {
    func label() -> some View {
        self
            .font(AppFonts.label)
            .fontWeight(.bold)
            .tracking(1.2)
            .foregroundColor(AppColors.onSurfaceVariant)
    }
    
    func bodyText() -> some View {
        self
            .font(AppFonts.body)
            .foregroundColor(AppColors.onSurfaceVariant)
    }
}

