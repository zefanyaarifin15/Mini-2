import Foundation
import SwiftData
import CoreData

struct PartnerConversation: Decodable {
    let partner_dialog: String
    let start_dialog: String
    let options: [UserOption]?
    let dialog: [Dialog]?
}

struct UserOption: Codable, Identifiable {
    let id: String
    let user_option: String
    let response: Response?

    struct Response: Codable {
        let text: String
        let options: [UserOption]?
    }
}

struct Dialog: Codable {
    let id: Int
    let user_options: [UserOption]
}

struct ConversationState: Codable {
    let selectedPartner: String
    let currDialogID: Int
    let userOptions: [UserOption]
}

struct History: Identifiable, Codable {
    var id = UUID()
    let content: String
    let isUser: Bool
    let partner: String
}
