import Foundation
import SwiftData

struct PartnerConversation: Decodable {
    let partner_dialog: String
    let start_dialog: String
    let options: [UserOption]
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

struct History: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
}

@Model
final class ConversationHistory {
    @Attribute(.unique) var id: UUID
    @Attribute var content: String
    @Attribute var isUser: Bool
    @Attribute var partner: String
    
    init(content: String, isUser: Bool, partner: String) {
        self.id = UUID()
        self.content = content
        self.isUser = isUser
        self.partner = partner
    }
}



