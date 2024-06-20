import Foundation

class ConversationViewModel: ObservableObject {
    @Published var conversations: [PartnerConversation] = []
    
    init() {
        loadJSONData()
    }
    
    func loadJSONData() {
        guard let url = Bundle.main.url(forResource: "messages", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.conversations = try decoder.decode([PartnerConversation].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func fetchFirstMessage(for partner: String) -> UserOption? {
        guard let conversation = conversations.first(where: { $0.partner_dialog == partner }) else {
            print("No conversation found for partner: \(partner)")
            return nil
        }
        
        guard let firstSegment = conversation.dialog.first else {
            print("No dialog segments found for partner: \(partner)")
            return nil
        }
        
        guard let firstOption = firstSegment.user_options.first else {
            print("No user options found in the first segment for partner: \(partner)")
            return nil
        }
        
        return firstOption
    }
}
