// File Name: HelpSupportScreen.swift
import SwiftUI

struct HelpSupportScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSidebar = false
    @State private var selectedTab: AppTab = .profile
    @State private var searchText = ""
    @State private var selectedCategory: HelpCategory? = nil
    @State private var showContactForm = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // Top Navigation Bar
                HelpSupportNavigationBar(showSidebar: $showSidebar)
                    .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content
                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        Spacer().frame(height: AppSpacing.md)
                        
                        // Header
                        VStack(spacing: AppSpacing.md) {
                            ZStack {
                                Circle()
                                    .fill(AppColors.surfaceContainerHigh)
                                    .frame(width: 80, height: 80)
                                
                                Image(systemName: "questionmark.circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(AppColors.primary)
                            }
                            
                            Text("How can we help you?")
                                .font(AppFonts.headlineLarge)
                                .foregroundColor(AppColors.onSurface)
                            
                            Text("Search for answers or browse topics below")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            TextField("Search help articles...", text: $searchText)
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurface)
                                .autocapitalization(.none)
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(AppColors.onSurfaceVariant)
                                }
                            }
                        }
                        .padding(AppSpacing.md)
                        .background(AppColors.surfaceContainer)
                        .cornerRadius(AppRadius.md)
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Quick Actions
                        VStack(spacing: 0) {
                            HStack {
                                Text("QUICK ACTIONS")
                                    .font(AppFonts.label)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                Spacer()
                            }
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.bottom, AppSpacing.sm)
                            
                            VStack(spacing: AppSpacing.md) {
                                HelpQuickActionCard(
                                    icon: "bubble.left.and.bubble.right.fill",
                                    title: "Contact Support",
                                    subtitle: "Get help from our support team",
                                    color: AppColors.primary,
                                    action: { showContactForm = true }
                                )
                                
                                HelpQuickActionCard(
                                    icon: "bolt.fill",
                                    title: "Report a Bug",
                                    subtitle: "Let us know about technical issues",
                                    color: AppColors.primary,
                                    action: { print("Report Bug tapped") }
                                )
                                
                                HelpQuickActionCard(
                                    icon: "lightbulb.fill",
                                    title: "Suggest a Feature",
                                    subtitle: "Share your ideas with us",
                                    color: AppColors.primary,
                                    action: { print("Suggest Feature tapped") }
                                )
                            }
                            .padding(.horizontal, AppSpacing.lg)
                        }
                        
                        // Help Categories
                        VStack(spacing: 0) {
                            HStack {
                                Text("BROWSE TOPICS")
                                    .font(AppFonts.label)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                Spacer()
                            }
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.bottom, AppSpacing.sm)
                            
                            VStack(spacing: AppSpacing.md) {
                                ForEach(HelpCategory.allCases) { category in
                                    HelpCategoryCard(category: category) {
                                        selectedCategory = category
                                    }
                                }
                            }
                            .padding(.horizontal, AppSpacing.lg)
                        }
                        
                        // FAQs
                        VStack(spacing: 0) {
                            HStack {
                                Text("FREQUENTLY ASKED QUESTIONS")
                                    .font(AppFonts.label)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                Spacer()
                            }
                            .padding(.horizontal, AppSpacing.lg)
                            .padding(.bottom, AppSpacing.sm)
                            
                            VStack(spacing: AppSpacing.sm) {
                                ForEach(frequentlyAskedQuestions) { faq in
                                    FAQRow(faq: faq)
                                }
                            }
                            .padding(.horizontal, AppSpacing.lg)
                        }
                        
                        // Contact Info
                        VStack(spacing: AppSpacing.md) {
                            HStack {
                                Text("OTHER WAYS TO REACH US")
                                    .font(AppFonts.label)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                                Spacer()
                            }
                            
                            ContactMethodCard(
                                icon: "envelope.fill",
                                title: "Email Support",
                                subtitle: "support@cinerate.app",
                                detail: "Response within 24 hours"
                            )
                            
                            ContactMethodCard(
                                icon: "message.fill",
                                title: "Live Chat",
                                subtitle: "Available 9AM - 6PM EST",
                                detail: "Monday to Friday",
                                badge: "Online"
                            )
                            
                            ContactMethodCard(
                                icon: "globe",
                                title: "Help Center",
                                subtitle: "help.cinerate.app",
                                detail: "Browse full documentation"
                            )
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        
                        Spacer().frame(height: AppSpacing.xxl)
                    }
                }
                .background(AppColors.surface)
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $showSidebar, isLoggedIn: true)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $showContactForm) {
            ContactSupportSheet()
        }
    }
}

// MARK: - Supporting Views

struct HelpSupportNavigationBar: View {
    @Binding var showSidebar: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 44, height: 44)
            }
            
            Text("Help & Support")
                .font(AppFonts.headlineLarge)
                .foregroundColor(AppColors.onSurface)
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showSidebar.toggle()
                }
            }) {
                VStack(spacing: 5) {
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: 30, height: 3)
                }
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.vertical, AppSpacing.md)
        .background(AppColors.surface)
    }
}

struct HelpQuickActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.2))
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text(subtitle)
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HelpCategoryCard: View {
    let category: HelpCategory
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.md) {
                Image(systemName: category.icon)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(category.title)
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                    
                    Text("\(category.articleCount) articles")
                        .font(AppFonts.label)
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FAQRow: View {
    let faq: FAQ
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(faq.question)
                            .font(AppFonts.body)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.onSurface)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.onSurfaceVariant)
                }
                .padding(AppSpacing.md)
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                Text(faq.answer)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.onSurfaceVariant)
                    .padding(.horizontal, AppSpacing.md)
                    .padding(.bottom, AppSpacing.md)
                    .transition(.opacity)
            }
        }
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
    }
}

struct ContactMethodCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let detail: String
    var badge: String? = nil
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            ZStack {
                Circle()
                    .fill(AppColors.primaryContainer.opacity(0.2))
                    .frame(width: 48, height: 48)
                
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(AppFonts.body)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.onSurface)
                    
                    if let badge = badge {
                        Text(badge)
                            .font(AppFonts.label)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, AppSpacing.sm)
                            .padding(.vertical, 2)
                            .background(Color.green)
                            .cornerRadius(AppRadius.md)
                    }
                }
                
                Text(subtitle)
                    .font(AppFonts.bodySmall)
                    .foregroundColor(AppColors.primary)
                
                Text(detail)
                    .font(AppFonts.label)
                    .foregroundColor(AppColors.onSurfaceVariant)
            }
            
            Spacer()
        }
        .padding(AppSpacing.md)
        .background(AppColors.surfaceContainer)
        .cornerRadius(AppRadius.md)
    }
}

struct ContactSupportSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var subject = ""
    @State private var message = ""
    @State private var selectedCategory = "General"
    
    let categories = ["General", "Technical Issue", "Account", "Billing", "Feature Request", "Other"]
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.surface.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: AppSpacing.lg) {
                        Spacer().frame(height: AppSpacing.md)
                        
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("Name")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            TextField("Your name", text: $name)
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurface)
                                .padding(AppSpacing.md)
                                .background(AppColors.surfaceContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("Email")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            TextField("your.email@example.com", text: $email)
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurface)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .padding(AppSpacing.md)
                                .background(AppColors.surfaceContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("Category")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            Menu {
                                ForEach(categories, id: \.self) { category in
                                    Button(category) {
                                        selectedCategory = category
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedCategory)
                                        .font(AppFonts.body)
                                        .foregroundColor(AppColors.onSurface)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12))
                                        .foregroundColor(AppColors.onSurfaceVariant)
                                }
                                .padding(AppSpacing.md)
                                .background(AppColors.surfaceContainer)
                                .cornerRadius(AppRadius.md)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("Subject")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            TextField("Brief description", text: $subject)
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurface)
                                .padding(AppSpacing.md)
                                .background(AppColors.surfaceContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            Text("Message")
                                .font(AppFonts.bodySmall)
                                .foregroundColor(AppColors.onSurfaceVariant)
                            
                            TextEditor(text: $message)
                                .font(AppFonts.body)
                                .foregroundColor(AppColors.onSurface)
                                .frame(height: 150)
                                .padding(AppSpacing.sm)
                                .background(AppColors.surfaceContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        
                        Button(action: {
                            // Submit form
                            dismiss()
                        }) {
                            Text("Send Message")
                                .font(AppFonts.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(AppColors.primaryContainer)
                                .cornerRadius(AppRadius.md)
                        }
                        .padding(.top, AppSpacing.md)
                        
                        Spacer()
                    }
                    .padding(.horizontal, AppSpacing.lg)
                }
            }
            .navigationTitle("Contact Support")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(AppColors.primary)
                }
            }
        }
    }
}

// MARK: - Supporting Types

enum HelpCategory: String, CaseIterable, Identifiable {
    case gettingStarted = "Getting Started"
    case account = "Account & Profile"
    case ratings = "Ratings & Reviews"
    case watchlist = "Watchlist & Library"
    case privacy = "Privacy & Security"
    case billing = "Billing & Subscription"
    case technical = "Technical Issues"
    case features = "Features & How-To"
    
    var id: String { rawValue }
    
    var title: String { rawValue }
    
    var icon: String {
        switch self {
        case .gettingStarted: return "play.circle.fill"
        case .account: return "person.circle.fill"
        case .ratings: return "star.circle.fill"
        case .watchlist: return "bookmark.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .billing: return "creditcard.circle.fill"
        case .technical: return "wrench.and.screwdriver.fill"
        case .features: return "sparkles"
        }
    }
    
    var articleCount: Int {
        switch self {
        case .gettingStarted: return 12
        case .account: return 18
        case .ratings: return 15
        case .watchlist: return 10
        case .privacy: return 14
        case .billing: return 8
        case .technical: return 22
        case .features: return 25
        }
    }
}

struct FAQ: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

let frequentlyAskedQuestions: [FAQ] = [
    FAQ(
        question: "How do I create an account?",
        answer: "You can create an account by tapping the 'Sign Up' button on the home screen. Fill in your details including email, username, and password. Verify your email address to complete the registration."
    ),
    FAQ(
        question: "Can I import my ratings from other platforms?",
        answer: "Yes! Go to Settings > Import Data and select the platform you want to import from. We support importing from IMDb, Letterboxd, and other popular movie rating platforms."
    ),
    FAQ(
        question: "How do I delete my account?",
        answer: "To delete your account, go to Settings > Account > Delete Account. Please note that this action is permanent and cannot be undone. All your ratings, reviews, and data will be permanently removed."
    ),
    FAQ(
        question: "Why can't I see some movies or TV shows?",
        answer: "Content availability varies by region due to licensing restrictions. Make sure your region settings are correct in Settings > General > Region."
    ),
    FAQ(
        question: "How do I report inappropriate content or users?",
        answer: "Tap the three-dot menu on any review or profile and select 'Report'. Choose the reason for reporting and submit. Our moderation team will review it within 24 hours."
    )
]

// MARK: - Preview

#Preview {
    HelpSupportScreen()
}
