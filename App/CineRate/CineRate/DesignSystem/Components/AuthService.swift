import Foundation
import Supabase
import Auth
import Combine

/// Service for handling authentication operations
@MainActor
final class AuthService: ObservableObject {
    
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    
    private let client = SupabaseConfig.shared.client
    
    init() {
        setupAuthListener()
    }
    
    // MARK: - Auth State Listener
    
    /// Set up listener for auth state changes across app lifecycle
    private func setupAuthListener() {
        Task { @MainActor in
            do {
                for await (event, session) in await client.auth.authStateChanges {
                    switch event {
                    case .signedIn:
                        if let session = session {
                            self.currentUser = session.user
                            self.isAuthenticated = true
                            print("✅ User signed in: \(session.user.email ?? "unknown")")
                        }
                        
                    case .signedOut:
                        self.currentUser = nil
                        self.isAuthenticated = false
                        print("👋 User signed out")
                        
                    case .tokenRefreshed:
                        if let session = session {
                            self.currentUser = session.user
                            self.isAuthenticated = true
                            print("🔄 Token refreshed")
                        }
                        
                    case .userUpdated:
                        if let session = session {
                            self.currentUser = session.user
                            print("📝 User updated")
                        }
                        
                    default:
                        break
                    }
                }
            } catch is CancellationError {
                // Auth listener was cancelled, ignore silently
                #if DEBUG
                print("ℹ️ Auth listener cancelled")
                #endif
            } catch {
                #if DEBUG
                print("❌ Auth listener error: \(error)")
                #endif
            }
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
