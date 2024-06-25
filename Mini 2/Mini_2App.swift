import SwiftUI

@main
struct Mini_2App: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            PhoneView()
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
