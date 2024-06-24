import Foundation

struct NotificationModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let body: String
}
