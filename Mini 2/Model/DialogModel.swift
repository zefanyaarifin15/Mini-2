import Foundation

struct PartnerConversation: Codable {
    let partner_dialog: String
    let start_dialog: String
    let dialog: [DialogSegment]
}

struct DialogSegment: Codable, Identifiable {
    let id: Int
    let user_options: [UserOption]
}

struct UserOption: Codable, Identifiable {
    let id: String
    let reply: String
    let response: String
}

struct History: Identifiable, Codable {
    var id = UUID()
    let content: String
    let isUser: Bool
    let partner: String
}

