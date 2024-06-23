import Foundation

class DialogViewModel: ObservableObject {
    @Published var conversations: [PartnerConversation] = []
    @Published var histories: [History] = []
    @Published var userResponse: String = ""
    @Published var currDialogID: Int = 1
    @Published var selectedPartner: String = ""
    @Published var userOptions: [UserOption] = []

    init() {
        initialSetup()
    }
    
    func loadJSONData() {
        guard let url = Bundle.main.url(forResource: "messages", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            conversations = try decoder.decode([PartnerConversation].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func fetchPartners() -> [String] {
        conversations.map { $0.partner_dialog }
    }
    
    func changeSelectedPartner(to newPartner: String) {
        selectedPartner = newPartner
        histories.removeAll()
        currDialogID = 1
        userOptions = fetchUserOptions(for: newPartner, dialogID: currDialogID) ?? []
    }
    
    func fetchUserOptions(for partner: String, dialogID: Int) -> [UserOption]? {
        conversations
            .first(where: { $0.partner_dialog == partner })?
            .dialog
            .first(where: { $0.id == dialogID })?
            .user_options
    }
    
    func selectOption(option: UserOption) {
        histories.append(History(content: option.reply, isUser: true))
        histories.append(History(content: option.response, isUser: false))
        currDialogID += 1
        userOptions = fetchUserOptions(for: selectedPartner, dialogID: currDialogID) ?? []
    }
    
    func appendStartDialogHistory(for partner: String) {
        if let conversation = conversations.first(where: { $0.partner_dialog == partner }) {
            histories.append(History(content: conversation.start_dialog, isUser: false))
        }
    }
    func initialSetup() {
        loadJSONData()
        if let conversation = conversations.first(where: { $0.partner_dialog == selectedPartner }) {
            histories.append(History(content: conversation.start_dialog, isUser: false))
        }
        userOptions = fetchUserOptions(for: selectedPartner, dialogID: currDialogID) ?? []
    }
}
