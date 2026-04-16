import Foundation
import Supabase

/// Service for handling authentication operations
@MainActor
final class AuthService: ObservableObject {
    
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    
    private let client = SupabaseConfig.shared.client
    
    init() {
        Task {
            await checkAuthStatus()
        }
    }
    
    // MARK: - Authentication Status
    
    /// Check if user is currently authenticated
    func checkAuthStatus() async {
        do {
            let session = try await client.auth.session
            self.currentUser = session.user
            self.isAuthenticated = true
        } catch {
            self.currentUser = nil
            self.isAuthenticated = false
        }
    }
    
    // MARK: - Sign Up
    
    /// Create a new user account
    func signUp(email: String, password: String) async throws {
        let response = try await client.auth.signUp(
            email: email,
            password: password
        )
        
        self.currentUser = response.user
        self.isAuthenticated = true
    }
    
    // MARK: - Sign In
    
    /// Sign in with existing credentials
    func signIn(email: String, password: String) async throws {
        let response = try await client.auth.signIn(
            email: email,
            password: password
        )
        
        self.currentUser = response.user
        self.isAuthenticated = true
    }
    
    // MARK: - Sign Out
    
    /// Sign out current user
    func signOut() async throws {
        try await client.auth.signOut()
        self.currentUser = nil
        self.isAuthenticated = false
    }
    
    // MARK: - Password Reset
    
    /// Send password reset email
    func resetPassword(email: String) async throws {
        try await client.auth.resetPasswordForEmail(email)
    }
}
