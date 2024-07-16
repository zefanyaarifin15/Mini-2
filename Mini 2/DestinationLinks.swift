
import Foundation
import SwiftUI

final class DestinationLinks: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case home
        case chatRose
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
