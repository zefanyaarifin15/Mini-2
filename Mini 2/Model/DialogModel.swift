import Foundation

struct PartnerConversation: Codable {
    let partner_dialog: String
    let start_dialog: String
    let dialog: [DialogSegment]
}

struct DialogSegment: Codable {
    let id: Int
    let user_options: [UserOption]
}

struct UserOption: Codable {
    let id: String
    let reply: String
    let response: String
}
