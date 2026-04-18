import SwiftUI
import Auth

@main
struct CineRateApp: App {
    @StateObject private var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            MainTabContainer()
                .environmentObject(authService)
        }
    }
}
