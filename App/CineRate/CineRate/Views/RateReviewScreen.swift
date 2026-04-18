// File Name: RateReviewScreen.swift
import SwiftUI
import Auth

struct RateReviewScreen: View {
    let media: Media
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authService: AuthService
    @State private var showSidebar = false
    @State private var selectedTab: AppTab = .home
    
    // Services
    private let reviewService = ReviewService()
    
    // Review State
    @State private var rating: Double = 0
    @State private var reviewTitle: String = ""
    @State private var reviewText: String = ""
    
    // UI State
    @State private var showRatingHelper = false
    @State private var showSubmitConfirmation = false
    @State private var isSubmitting = false
    @State private var errorMessage: String?
    @State private var showError = false
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case title
        case review
    }
    
    var isFormValid: Bool {
        rating > 0 && !reviewTitle.isEmpty && !reviewText.isEmpty && reviewText.count >= 50
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            AppColors.surface
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Navigation Bar
                RateReviewNavigationBar(
                    showSidebar: $showSidebar,
                    onDismiss: { dismiss() }
                )
                .background(AppColors.surface.ignoresSafeArea(edges: .top))
                
                // Main Content
                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        Spacer().frame(height: AppSpacing.md)
                        
                        // Media Header Section
                        MediaHeaderSection(media: media)
                            .padding(.horizontal, AppSpacing.lg)
                        
                        // Rating Section
                        RatingInputSection(
                            rating: $rating,
                            showHelper: $showRatingHelper
                        )
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Review Title Section
                        ReviewTitleSection(
                            title: $reviewTitle,
                            focusedField: $focusedField
                        )
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Review Text Section
                        ReviewTextSection(
                            reviewText: $reviewText,
                            focusedField: $focusedField
                        )
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Guidelines Section
                        ReviewGuidelinesSection()
                            .padding(.horizontal, AppSpacing.lg)
                        
                        // Submit Button
                        VStack(spacing: AppSpacing.md) {
                            Button(action: {
                                submitReview()
                            }) {
                                HStack {
                                    if isSubmitting {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                            .scaleEffect(0.8)
                                    }
                                    Text(isSubmitting ? "Submitting..." : "Submit Review")
                                }
                            }
                            .buttonStyle(PrimaryButtonStyle())
                            .disabled(!isFormValid || isSubmitting)
                            .opacity((isFormValid && !isSubmitting) ? 1.0 : 0.5)
                            
                            Button(action: {
                                dismiss()
                            }) {
                                Text("Cancel")
                                    .font(AppFonts.body)
                                    .foregroundColor(AppColors.onSurfaceVariant)
                            }
                            .disabled(isSubmitting)
                        }
                        .padding(.horizontal, AppSpacing.lg)
                        
                        // Extra padding for bottom nav
                        Spacer().frame(height: 100)
                    }
                }
                .background(AppColors.surface)
                .contentShape(Rectangle())
                .onTapGesture {
                    focusedField = nil
                }
            }
            
            // Bottom Navigation Bar
            CustomNavigationBar(selectedTab: $selectedTab)
            
            // Sidebar Overlay
            Sidebar(isShowing: $showSidebar, isLoggedIn: true)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .alert("Review Submitted!", isPresented: $showSubmitConfirmation) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("Thank you for sharing your thoughts!")
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage ?? "An unknown error occurred.")
        }
    }
    
    private func submitReview() {
        // Ensure user is authenticated
        guard let userId = authService.currentUser?.id else {
            errorMessage = "You must be logged in to submit a review."
            showError = true
            return
        }
        
        // Convert media ID from String to Int
        guard let mediaId = Int(media.id) else {
            errorMessage = "Invalid media ID."
            showError = true
            return
        }
        
        // Map from local MediaType (in MediaModels) to Supabase DBMediaType
        // MediaModels.MediaType has: .movie = "Movie", .tvShow = "TV Show"
        // DBMediaType has: .movie, .tv (rawValue "movie", "tv")
        let supabaseMediaType = DBMediaType(from: media.type)
        
        // Combine title and text for the comment
        let fullComment = "**\(reviewTitle)**\n\n\(reviewText)"
        
        isSubmitting = true
        
        Task { @MainActor in
            do {
                // Submit review (automatically handles insert or update)
                let submittedReview = try await reviewService.submitReview(
                    userId: userId,
                    mediaId: mediaId,
                    mediaType: supabaseMediaType,
                    rating: rating,
                    comment: fullComment
                )
                
                print("✅ Review submitted successfully: \(submittedReview.id)")
                isSubmitting = false
                showSubmitConfirmation = true
                
            } catch {
                print("❌ Error submitting review: \(error)")
                errorMessage = "Failed to submit review: \(error.localizedDescription)"
                showError = true
                isSubmitting = false
            }
        }
    }
}

// MARK: - Navigation Bar

struct RateReviewNavigationBar: View {
    @Binding var showSidebar: Bool
    let onDismiss: () -> Void
    
    var body: some View {
        HStack {
            // Back Button
            Button(action: onDismiss) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primary)
                    .frame(width: 44, height: 44)
            }
            
            Spacer()
            
            // Title
            Text("WRITE REVIEW")
                .font(AppFonts.headlineMedium)
                .fontWeight(.bold)
                .tracking(1)
                .foregroundColor(AppColors.onSurface)
            
            Spacer()
            
            // Menu Button
            Button(action: {
                showSidebar.toggle()
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

// MARK: - Media Header Section

struct MediaHeaderSection: View {
    let media: Media
    
    var body: some View {
        VStack(spacing: AppSpacing.md) {
            HStack(alignment: .top, spacing: AppSpacing.md) {
                // Poster Image
                ZStack {
                    Rectangle()
                        .fill(AppColors.surfaceContainerHigh)
                        .frame(width: 80, height: 120)
                        .cornerRadius(AppRadius.md)
                    
                    Image(systemName: media.posterImage)
                        .font(.system(size: 30))
                        .foregroundColor(AppColors.onSurfaceVariant.opacity(0.5))
                }
                
                // Media Info
                VStack(alignment: .leading, spacing: 6) {
                    Text(media.title)
                        .font(AppFonts.headlineMedium)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                        .lineLimit(2)
                    
                    HStack(spacing: 4) {
                        Text(media.releaseYear)
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                        
                        Text("•")
                            .foregroundColor(AppColors.onSurfaceVariant)
                        
                        Text(media.type == .movie ? "Movie" : "TV Show")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                    
                    // Genres
                    Text(media.genres.prefix(3).joined(separator: ", "))
                        .font(AppFonts.bodySmall)
                        .foregroundColor(AppColors.onSurfaceVariant)
                        .lineLimit(1)
                    
                    // Community Rating
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.yellow)
                        
                        Text(String(format: "%.1f/5", media.averageRating))
                            .font(AppFonts.bodySmall)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.onSurface)
                        
                        Text("(\(formatRatingCount(media.totalRatings)) ratings)")
                            .font(AppFonts.label)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                }
                
                Spacer()
            }
            .padding(AppSpacing.md)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.md)
        }
    }
    
    private func formatRatingCount(_ count: Int) -> String {
        if count >= 1000 {
            return String(format: "%.1fK", Double(count) / 1000.0)
        }
        return "\(count)"
    }
}

// MARK: - Rating Input Section

struct RatingInputSection: View {
    @Binding var rating: Double
    @Binding var showHelper: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            // Section Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("YOUR RATING")
                        .font(AppFonts.label)
                        .tracking(1.5)
                        .foregroundColor(AppColors.onSurfaceVariant)
                    
                    Text("Rate this title")
                        .font(AppFonts.headlineMedium)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.onSurface)
                }
                
                Spacer()
                
                Button(action: {
                    showHelper.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 20))
                        .foregroundColor(AppColors.primary)
                }
            }
            
            // Rating Display and Input
            VStack(spacing: AppSpacing.lg) {
                // Large Rating Number
                Text(rating > 0 ? String(format: "%.1f", rating) : "—")
                    .font(.system(size: 72, weight: .bold))
                    .foregroundColor(rating > 0 ? AppColors.primary : AppColors.onSurfaceVariant.opacity(0.3))
                    .animation(.spring(response: 0.3), value: rating)
                
                // Star Rating
                HStack(spacing: AppSpacing.md) {
                    ForEach(1...5, id: \.self) { index in
                        Button(action: {
                            withAnimation {
                                rating = Double(index)
                            }
                        }) {
                            Image(systemName: Double(index) <= rating ? "star.fill" : "star")
                                .font(.system(size: 36))
                                .foregroundColor(Double(index) <= rating ? .yellow : AppColors.onSurfaceVariant.opacity(0.3))
                        }
                    }
                }
                .padding(.bottom, AppSpacing.sm)
                
                // Slider for Fine Tuning
                VStack(spacing: AppSpacing.sm) {
                    HStack {
                        Text("FINE TUNE")
                            .font(AppFonts.label)
                            .tracking(1)
                            .foregroundColor(AppColors.onSurfaceVariant)
                        
                        Spacer()
                    }
                    
                    Slider(value: $rating, in: 0...5, step: 0.5)
                        .tint(AppColors.primary)
                    
                    HStack {
                        Text("0")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                        
                        Spacer()
                        
                        Text("5")
                            .font(AppFonts.bodySmall)
                            .foregroundColor(AppColors.onSurfaceVariant)
                    }
                }
                
                // Rating Helper (if shown)
                if showHelper {
                    VStack(alignment: .leading, spacing: AppSpacing.sm) {
                        RatingHelpRow(stars: "⭐️", label: "Terrible - Waste of time")
                        RatingHelpRow(stars: "⭐️⭐️", label: "Poor - Not worth it")
                        RatingHelpRow(stars: "⭐️⭐️⭐️", label: "Average - It's okay")
                        RatingHelpRow(stars: "⭐️⭐️⭐️⭐️", label: "Good - Worth watching")
                        RatingHelpRow(stars: "⭐️⭐️⭐️⭐️⭐️", label: "Excellent - Masterpiece!")
                    }
                    .padding(AppSpacing.md)
                    .background(AppColors.surfaceContainerHigh)
                    .cornerRadius(AppRadius.md)
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(AppSpacing.lg)
            .background(AppColors.surfaceContainer)
            .cornerRadius(AppRadius.lg)
        }
    }
}

struct RatingHelpRow: View {
    let stars: String
    let label: String
    
    var body: some View {
        HStack {
            Text(stars)
                .font(.system(size: 14))
            Text(label)
                .font(AppFonts.bodySmall)
                .foregroundColor(AppColors.onSurface)
            Spacer()
        }
    }
}

// MARK: - Review Title Section

struct ReviewTitleSection: View {
    @Binding var title: String
    var focusedField: FocusState<RateReviewScreen.Field?>.Binding
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            // Section Header
            VStack(alignment: .leading, spacing: 4) {
                Text("REVIEW TITLE")
                    .font(AppFonts.label)
                    .tracking(1.5)
                    .foregroundColor(AppColors.onSurfaceVariant)
                
                Text("Summarize your thoughts")
                    .font(AppFonts.headlineMedium)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.onSurface)
            }
            
            // Text Input
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                TextField("e.g., A thrilling masterpiece!", text: $title)
                    .font(AppFonts.body)
                    .foregroundColor(AppColors.onSurface)
                    .padding(AppSpacing.md)
                    .background(AppColors.surfaceContainer)
                    .cornerRadius(AppRadius.md)
                    .focused(focusedField, equals: .title)
                
                HStack {
                    Spacer()
                    Text("\(title.count)/100")
                        .font(AppFonts.label)
                        .foregroundColor(title.count > 100 ? .red : AppColors.onSurfaceVariant)
                }
            }
        }
    }
}

// MARK: - Review Text Section

struct ReviewTextSection: View {
    @Binding var reviewText: String
    var focusedField: FocusState<RateReviewScreen.Field?>.Binding
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            // Section Header
            VStack(alignment: .leading, spacing: 4) {
                Text("YOUR REVIEW")
                    .font(AppFonts.label)
                    .tracking(1.5)
                    .foregroundColor(AppColors.onSurfaceVariant)
                
                Text("Share your experience")
                    .font(AppFonts.headlineMedium)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.onSurface)
            }
            
            // Text Editor
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                ZStack(alignment: .topLeading) {
                    // Background
                    RoundedRectangle(cornerRadius: AppRadius.md)
                        .fill(AppColors.surfaceContainer)
                    
                    // Placeholder
                    if reviewText.isEmpty {
                        Text("What did you think about this title? Share your honest opinion...\n\nTalk about the plot, acting, direction, cinematography, or anything that stood out to you.")
                            .font(AppFonts.body)
                            .foregroundColor(AppColors.onSurfaceVariant.opacity(0.5))
                            .padding(AppSpacing.md)
                            .padding(.top, 8)
                    }
                    
                    // Text Editor
                    TextEditor(text: $reviewText)
                        .font(AppFonts.body)
                        .foregroundColor(AppColors.onSurface)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .padding(AppSpacing.md)
                        .focused(focusedField, equals: .review)
                }
                .frame(minHeight: 200)
                
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: reviewText.count >= 50 ? "checkmark.circle.fill" : "info.circle")
                            .font(.system(size: 12))
                            .foregroundColor(reviewText.count >= 50 ? .green : AppColors.onSurfaceVariant)
                        
                        Text("Minimum 50 characters")
                            .font(AppFonts.label)
                            .foregroundColor(reviewText.count >= 50 ? .green : AppColors.onSurfaceVariant)
                    }
                    
                    Spacer()
                    
                    Text("\(reviewText.count)/5000")
                        .font(AppFonts.label)
                        .foregroundColor(reviewText.count > 5000 ? .red : AppColors.onSurfaceVariant)
                }
            }
        }
    }
}

// MARK: - Review Guidelines Section

struct ReviewGuidelinesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.primary)
                
                Text("REVIEW GUIDELINES")
                    .font(AppFonts.label)
                    .tracking(1)
                    .foregroundColor(AppColors.primary)
            }
            
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                GuidelineRow(text: "Be respectful and constructive")
                GuidelineRow(text: "Focus on the content, not other reviewers")
                GuidelineRow(text: "Avoid profanity and offensive language")
                GuidelineRow(text: "Don't post promotional or spam content")
            }
        }
        .padding(AppSpacing.md)
        .background(AppColors.primaryContainer.opacity(0.1))
        .cornerRadius(AppRadius.md)
        .overlay(
            RoundedRectangle(cornerRadius: AppRadius.md)
                .stroke(AppColors.primary.opacity(0.2), lineWidth: 1)
        )
    }
}

struct GuidelineRow: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.sm) {
            Image(systemName: "checkmark")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(AppColors.primary)
                .frame(width: 16)
            
            Text(text)
                .font(AppFonts.bodySmall)
                .foregroundColor(AppColors.onSurface)
            
            Spacer()
        }
    }
}

// MARK: - Supporting Extensions

extension AppFonts {
    static let headlineMedium: Font = .custom("Inter", size: 20)
}

// MARK: - Preview

#Preview("Rate Review Screen") {
    RateReviewScreen(media: .sampleMovie)
}

#Preview("Rate Review Screen - TV Show") {
    RateReviewScreen(media: .sampleTVShow)
}
