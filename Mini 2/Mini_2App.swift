import SwiftUI

@main
struct Mini_2App: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject private var viewModel = DialogViewModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            PhoneView()
                .environmentObject(viewModel) // Provide the viewModel to the view hierarchy
                .onChange(of: scenePhase) { phase in
                    handleScenePhaseChange(phase)
                }
        }
    }
    
    private func handleScenePhaseChange(_ phase: ScenePhase) {
        switch phase {
        case .active:
            // App is now active (foreground)
            break // Optionally handle any necessary actions
        case .inactive:
            // App is about to become inactive (background)
            viewModel.resetChatStorage() // Reset chat storage
        case .background:
            // App is in the background
            viewModel.resetChatStorage() // Reset chat storage
        @unknown default:
            break // Handle future cases if needed
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Customize navigation bar appearance
        UINavigationBar.appearance().tintColor = UIColor.greenInstaQ // Customize back button color

        return true
    }
}
