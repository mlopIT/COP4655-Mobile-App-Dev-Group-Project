import SwiftUI

struct CreateAccountScreen: View {
    @FocusState private var isAnyFieldFocused: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            AppColors.surface
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: AppSpacing.xxl) {
                    // Header
                    CreateAccountHeader()
                    
                    // Main Content Sections
                    HeroSection()
                    
                    FeaturesSection()
                    
                    RegistrationFormSection(isAnyFieldFocused: $isAnyFieldFocused)
                    
                    FooterSection()
                }
                // Safe padding for bottom navigation bar
                .padding(.bottom, isAnyFieldFocused ? 20 : 120)
            }
            .ignoresSafeArea(edges: .top) // Allows header to bleed up if needed
            // Tap to dismiss keyboard
            .contentShape(Rectangle())
            .onTapGesture {
                isAnyFieldFocused = false
            }
            
            // Bottom Navigation Bar - Hidden when keyboard is visible
            if !isAnyFieldFocused {
                CustomNavigationBar()
                    .ignoresSafeArea(.container, edges: .bottom)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isAnyFieldFocused)
    }
}

// MARK: - Subviews

struct CreateAccountHeader: View {
    var body: some View {
        HStack {
            Text("CINERATE")
                .font(AppFonts.title)
                .tracking(2)
                .foregroundColor(AppColors.onSurface)
            
            Spacer()
            
            Button(action: {
                // Close action
            }) {
                HStack(spacing: 4) {
                    Text("CLOSE")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.top, 60) // Adjust for top safe area
    }
}

struct HeroSection: View {
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Text("SIGN UP NOW")
                .label()
                .tracking(2)
            
            // Highlighted text using string interpolation/concatenation
            (Text("Your one-way ticket to the ")
                .foregroundColor(AppColors.onSurface) +
             Text("Greatest Stories")
                .foregroundColor(AppColors.primary) +
             Text(" Ever Told."))
                .font(AppFonts.displayLarge)
                .multilineTextAlignment(.center)
            
            Text("Step into the inner circle of cinema. Access community reviews, and more—designed for true film lovers.")
                .bodyText()
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.md)
            
            VStack(spacing: AppSpacing.md) {
                Button("Sign Up Now") { }
                    .buttonStyle(PrimaryButtonStyle())
                
                // Divider with "OR"
                HStack {
                    Rectangle()
                        .fill(AppColors.outlineVariant)
                        .frame(height: 1)
                    
                    Text("OR")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .padding(.horizontal, AppSpacing.md)
                    
                    Rectangle()
                        .fill(AppColors.outlineVariant)
                        .frame(height: 1)
                }
                .padding(.vertical, AppSpacing.sm)
                
                // Google Sign In Button
                Button(action: {
                    // Google sign-in action
                }) {
                    HStack(spacing: AppSpacing.md) {
                        Image(systemName: "globe")
                            .font(.system(size: 18, weight: .semibold))
                        Text("CONTINUE WITH GOOGLE")
                            .font(AppFonts.label)
                            .tracking(1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(AppSpacing.md)
                    .background(AppColors.surfaceContainerHigh)
                    .foregroundColor(AppColors.onSurface)
                    .cornerRadius(AppRadius.full)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppRadius.full)
                            .stroke(AppColors.outlineVariant, lineWidth: 1)
                    )
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct FeaturesSection: View {
    var body: some View {
        VStack(spacing: AppSpacing.md) {
            FeatureCard(
                icon: "film",
                title: "Movie Recommendations",
                description: "Never waste a Friday night browsing again. Find movies tailored to your evolving taste."
            )
            
            FeatureCard(
                icon: "chart.bar.fill",
                title: "Discover Hidden Gems",
                description: "Uncover underrated movies and shows through searching specific genres."
            )
            
            FeatureCard(
                icon: "person.3.fill",
                title: "Exclusive Community",
                description: "Join the conversation with fans who get it. Get ready for deep dives and respectful critique."
            )
            
            FeatureCard(
                icon: "checkmark.shield.fill",
                title: "Preserve Your History",
                description: "Your ratings, your reviews, your cinematic legacy. A permanent digital home for your film journey."
            )
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct FeatureCard: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(AppColors.primary)
            
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text(title)
                    .headline()
                Text(description)
                    .bodyText()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .solidCardStyle()
    }
}

struct RegistrationFormSection: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @FocusState.Binding var isAnyFieldFocused: Bool
    
    let tastes = ["AVANT-GARDE", "SMART-INDIE", "BINGE WATCHER", "NEW WAVE"]
    
    var body: some View {
        VStack(spacing: AppSpacing.xl) {
            VStack(spacing: AppSpacing.sm) {
                Text("Create Your Account")
                    .font(AppFonts.displayMedium)
                    .foregroundColor(AppColors.onSurface)
                Text("10 SECONDS. THAT'S IT.")
                    .label()
                    .tracking(1)
            }
            
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                // Name Input
                CustomTextField(label: "NAME", placeholder: "ALEX GONZALEZ", text: $name, isFocused: $isAnyFieldFocused)
                
                // Email Input
                CustomTextField(label: "EMAIL", placeholder: "ALEX@CINERATE.COM", text: $email, isFocused: $isAnyFieldFocused)
                
                // Password Input
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("PASSWORD")
                        .label()
                    SecureField("YOUR PASSWORD HERE", text: $password)
                        .focused($isAnyFieldFocused)
                        .padding(AppSpacing.md)
                        .background(AppColors.surfaceContainerHigh)
                        .cornerRadius(AppRadius.md)
                        .foregroundColor(AppColors.onSurface)
                }
                
                // Taste Tags
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("CINEMATIC TASTE")
                        .label()
                    
                    // Simple wrapping using HStacks (In a real app, you might use a FlowLayout or Grid)
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        HStack {
                            TasteTag(text: tastes[0], isSelected: true)
                            TasteTag(text: tastes[1], isSelected: false)
                        }
                        HStack {
                            TasteTag(text: tastes[2], isSelected: false)
                            TasteTag(text: tastes[3], isSelected: false)
                        }
                    }
                }
                .padding(.top, AppSpacing.sm)
            }
            
            VStack(spacing: AppSpacing.md) {
                Button("CREATE ACCOUNT") { }
                    .buttonStyle(PrimaryButtonStyle())
                
                // Divider with "OR"
                HStack {
                    Rectangle()
                        .fill(AppColors.outlineVariant)
                        .frame(height: 1)
                    
                    Text("OR")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .padding(.horizontal, AppSpacing.md)
                    
                    Rectangle()
                        .fill(AppColors.outlineVariant)
                        .frame(height: 1)
                }
                
                // Google Sign In Button
                Button(action: {
                    // Google sign-in action
                }) {
                    HStack(spacing: AppSpacing.md) {
                        Image(systemName: "globe")
                            .font(.system(size: 18, weight: .semibold))
                        Text("CONTINUE WITH GOOGLE")
                            .font(AppFonts.label)
                            .tracking(1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(AppSpacing.md)
                    .background(AppColors.surfaceContainerHigh)
                    .foregroundColor(AppColors.onSurface)
                    .cornerRadius(AppRadius.full)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppRadius.full)
                            .stroke(AppColors.outlineVariant, lineWidth: 1)
                    )
                }
                
                Text("By creating an account,\nyou agree to Cinerate's Terms and Conditions\nand Privacy Policy.")
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .multilineTextAlignment(.center)
                    .padding(.top, AppSpacing.sm)
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct CustomTextField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            Text(label)
                .label()
            TextField(placeholder, text: $text)
                .focused($isFocused)
                .padding(AppSpacing.md)
                .background(AppColors.surfaceContainerHigh)
                .cornerRadius(AppRadius.md)
                .foregroundColor(AppColors.onSurface)
        }
    }
}

struct TasteTag: View {
    var text: String
    var isSelected: Bool
    
    var body: some View {
        Text(text)
            .font(AppFonts.label)
            .foregroundColor(isSelected ? AppColors.onSurface : AppColors.onSurfaceVariant)
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, AppSpacing.sm)
            .background(isSelected ? AppColors.surfaceContainerHighest : AppColors.surfaceContainer)
            .cornerRadius(AppRadius.full)
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.full)
                    .stroke(isSelected ? AppColors.outlineVariant : Color.clear, lineWidth: 1)
            )
    }
}

struct FooterSection: View {
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Text("CINERATE")
                .font(AppFonts.title)
                .tracking(2)
                .foregroundColor(AppColors.onSurfaceVariant)
            
            HStack(spacing: AppSpacing.lg) {
                Text("ABOUT US").label()
                Text("COMMUNITY").label()
                Text("SUPPORT").label()
                Text("PRIVACY").label()
            }
            
            Text("© 2024 CINERATE. ALL RIGHTS RESERVED.")
                .font(AppFonts.label)
                .foregroundColor(AppColors.outlineVariant)
        }
        .padding(.top, AppSpacing.xl)
    }
}
