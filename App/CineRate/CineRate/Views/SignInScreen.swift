import SwiftUI

struct SignInScreen: View {
    @FocusState private var isAnyFieldFocused: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            AppColors.surface
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: AppSpacing.xxl) {
                    // Header
                    SignInHeader()
                    
                    // Main Content Sections
                    SignInHeroSection()
                    
                    SignInFormSection(isAnyFieldFocused: $isAnyFieldFocused)
                    
                    SignInBenefitsSection()
                    
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

struct SignInHeader: View {
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

struct SignInHeroSection: View {
    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Text("WELCOME BACK")
                .label()
                .tracking(2)
            
            // Highlighted text using string interpolation/concatenation
            (Text("Continue Your ")
                .foregroundColor(AppColors.onSurface) +
             Text("Cinematic Journey"))
                .font(AppFonts.displayLarge)
                .foregroundColor(AppColors.primary)
                .multilineTextAlignment(.center)
            
            Text("Sign in to access your watchlist, reviews, and personalized recommendations.")
                .bodyText()
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.md)
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct SignInFormSection: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = true
    @FocusState.Binding var isAnyFieldFocused: Bool
    
    var body: some View {
        VStack(spacing: AppSpacing.xl) {
            VStack(spacing: AppSpacing.sm) {
                Text("Sign In to Your Account")
                    .font(AppFonts.displayMedium)
                    .foregroundColor(AppColors.onSurface)
                Text("PICK UP WHERE YOU LEFT OFF")
                    .label()
                    .tracking(1)
            }
            
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                // Email Input
                CustomTextField(
                    label: "EMAIL",
                    placeholder: "YOUR@EMAIL.COM",
                    text: $email,
                    isFocused: $isAnyFieldFocused
                )
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                
                // Password Input
                VStack(alignment: .leading, spacing: AppSpacing.sm) {
                    Text("PASSWORD")
                        .label()
                    SecureField("YOUR PASSWORD", text: $password)
                        .focused($isAnyFieldFocused)
                        .padding(AppSpacing.md)
                        .background(AppColors.surfaceContainerHigh)
                        .cornerRadius(AppRadius.md)
                        .foregroundColor(AppColors.onSurface)
                }
                
                // Remember Me & Forgot Password
                HStack {
                    Button(action: {
                        rememberMe.toggle()
                    }) {
                        HStack(spacing: AppSpacing.sm) {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .font(.system(size: 18))
                                .foregroundColor(rememberMe ? AppColors.primary : AppColors.onSurfaceVariant)
                            
                            Text("Remember me")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurface)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Forgot password action
                    }) {
                        Text("Forgot Password?")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.primary)
                            .underline()
                    }
                }
                .padding(.top, AppSpacing.sm)
            }
            
            VStack(spacing: AppSpacing.md) {
                Button("SIGN IN") {
                    // Sign in action
                }
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
                
                // Sign Up Link
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurfaceVariant)
                    
                    Button(action: {
                        // Navigate to sign up
                    }) {
                        Text("Sign Up")
                            .font(AppFonts.body)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.primary)
                            .underline()
                    }
                }
                .padding(.top, AppSpacing.sm)
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct SignInBenefitsSection: View {
    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Text("WHY SIGN IN?")
                .label()
                .tracking(2)
                .foregroundColor(AppColors.primary)
            
            VStack(spacing: AppSpacing.md) {
                SignInBenefitCard(
                    icon: "bookmark.fill",
                    title: "Access Your Watchlist",
                    description: "Never lose track of films you want to watch."
                )
                
                SignInBenefitCard(
                    icon: "star.fill",
                    title: "Your Ratings & Reviews",
                    description: "Keep your cinematic opinions in one place."
                )
                
                SignInBenefitCard(
                    icon: "sparkles",
                    title: "Personalized Recommendations",
                    description: "Get suggestions tailored to your unique taste."
                )
                
                SignInBenefitCard(
                    icon: "person.2.fill",
                    title: "Connect with the Community",
                    description: "Join discussions with fellow film enthusiasts."
                )
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

struct SignInBenefitCard: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.md) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(AppColors.primary)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text(title)
                    .font(AppFonts.title)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.onSurface)
                
                Text(description)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            
            Spacer()
        }
        .padding(AppSpacing.md)
        .frame(maxWidth: .infinity)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
        .overlay(
            RoundedRectangle(cornerRadius: AppRadius.md)
                .stroke(AppColors.outlineVariant.opacity(0.5), lineWidth: 1)
        )
    }
}

// MARK: - Footer Section (Using shared FooterSection from CreateAccountScreen)

// MARK: - Preview

#Preview("Sign In Screen") {
    SignInScreen()
}
