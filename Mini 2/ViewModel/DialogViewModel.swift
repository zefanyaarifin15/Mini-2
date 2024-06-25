import Foundation

class DialogViewModel: ObservableObject {
    @Published var conversations: [PartnerConversation] = []
    @Published var histories: [History] = []
    @Published var selectedPartner: String = ""
    @Published var userOptions: [UserOption] = []
    @Published var currDialogID: Int = 1

    private let historyFileName = "ChatStorage.json"
    private let stateFileName = "Conversation.json"

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

    // Ambil nama2 partnersnya
    func fetchPartners() -> [String] {
        conversations.map { $0.partner_dialog }
    }

    // Ganti nama partner yang sedang dipilih
    func changeSelectedPartner(to newPartner: String) {
        selectedPartner = newPartner
        histories.removeAll()
        currDialogID = 1
        userOptions = fetchUserOptions(for: newPartner, dialogID: currDialogID)
        appendStartDialogHistoryIfNeeded(for: newPartner)
    }


    func fetchUserOptions(for partner: String, dialogID: Int) -> [UserOption] {
        guard let dialog = conversations.first(where: { $0.partner_dialog == partner })?.dialog.first(where: { $0.id == dialogID }) else {
            return []
        }
        return dialog.user_options
    }

    func selectOption(optionID: String) {
        guard let selectedOption = userOptions.first(where: { $0.id == optionID }) else {
            print("Error: UserOption not found for ID \(optionID)")
            return
        }

        histories.append(History(content: selectedOption.reply, isUser: true, partner: selectedPartner))
        saveHistoryToJSON()

        histories.append(History(content: selectedOption.response, isUser: false, partner: selectedPartner))
        saveHistoryToJSON()

        currDialogID += 1
        userOptions = fetchUserOptions(for: selectedPartner, dialogID: currDialogID)
        saveStateToJSON()
    }

    private func appendStartDialogHistoryIfNeeded(for partner: String) {
        if histories.isEmpty {
            if let conversation = conversations.first(where: { $0.partner_dialog == partner }) {
                histories.append(History(content: conversation.start_dialog, isUser: false, partner: partner))
                saveHistoryToJSON()
            }
        }
    }

    private func saveHistoryToJSON() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(histories) {
            let url = getDocumentsDirectory().appendingPathComponent(historyFileName)
            try? encodedData.write(to: url)
        }
    }

    private func loadHistoryFromJSON() {
        let url = getDocumentsDirectory().appendingPathComponent(historyFileName)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let decodedHistories = try? decoder.decode([History].self, from: data) {
                histories = decodedHistories
            }
        }
    }

    private func saveStateToJSON() {
        let state = ConversationState(selectedPartner: selectedPartner, currDialogID: currDialogID, userOptions: userOptions)
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(state) {
            let url = getDocumentsDirectory().appendingPathComponent(stateFileName)
            try? encodedData.write(to: url)
        }
    }

    private func loadStateFromJSON() {
        let url = getDocumentsDirectory().appendingPathComponent(stateFileName)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let decodedState = try? decoder.decode(ConversationState.self, from: data) {
                selectedPartner = decodedState.selectedPartner
                currDialogID = decodedState.currDialogID
                userOptions = decodedState.userOptions
            }
        }
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func resetChatStorage() {
        histories.removeAll()
        userOptions.removeAll()
        currDialogID = 1

        saveHistoryToJSON()
        saveStateToJSON()
        
        // Reinitialize the dialog for the selected partner
        appendStartDialogHistoryIfNeeded(for: selectedPartner)
        userOptions = fetchUserOptions(for: selectedPartner, dialogID: currDialogID)
    }

    func initialSetup() {
        loadJSONData()
        if let firstPartner = conversations.first?.partner_dialog {
            changeSelectedPartner(to: firstPartner)
        }
    }
}
