import SwiftUI

class DialogViewModel: ObservableObject {
    @Published var conversations: [PartnerConversation] = []
    @Published var histories: [History] = []
    @Published var selectedPartner: String = ""
    @Published var userOptions: [UserOption] = []
    @Published var currDialogID: Int = 1
    @Published var lastResponseText: String?

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

    func changeSelectedPartner(to newPartner: String) {
        selectedPartner = newPartner
        currDialogID = 1
        userOptions = fetchDialog(for: newPartner, dialogID: currDialogID)
        appendStartDialogHistoryIfNeeded(for: newPartner)
    }

    func fetchDialog(for partner: String, dialogID: Int) -> [UserOption] {
        guard let conversation = conversations.first(where: { $0.partner_dialog == partner }) else {
            return []
        }
        return conversation.dialog.first(where: { $0.id == dialogID })?.user_options ?? []
    }

    func selectOption(optionID: String) {
        guard let selectedOption = userOptions.first(where: { $0.id == optionID }) else {
            print("Error: UserOption not found for ID \(optionID)")
            return
        }

        saveHistory(content: selectedOption.reply, isUser: true, partner: selectedPartner)

        if let responseText = selectedOption.response {
            saveHistory(content: responseText, isUser: false, partner: selectedPartner)
            lastResponseText = responseText
        } else {
            lastResponseText = nil
        }

        currDialogID += 1
        userOptions = fetchDialog(for: selectedPartner, dialogID: currDialogID)
        saveState()
    }

    private func appendStartDialogHistoryIfNeeded(for partner: String) {
        guard let conversation = conversations.first(where: { $0.partner_dialog == partner }) else {
            return
        }

    
        if !histories.contains(where: { $0.content == conversation.start_dialog }) {
            saveHistory(content: conversation.start_dialog, isUser: false, partner: partner)
        }
    }

    private func saveHistory(content: String, isUser: Bool, partner: String) {
        let newHistory = History(content: content, isUser: isUser, partner: partner)
        histories.append(newHistory)
        saveHistoryToJSON() // Save history to JSON file
    }

    private func saveHistoryToJSON() {
        do {
            let data = try JSONEncoder().encode(histories)
            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ChatStorage.json") {
                try data.write(to: url)
            }
        } catch {
            print("Failed to save history to JSON: \(error)")
        }
    }

    private func loadHistoryFromJSON() {
        do {
            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ChatStorage.json") {
                let data = try Data(contentsOf: url)
                histories = try JSONDecoder().decode([History].self, from: data)
            }
        } catch {
            print("Failed to load history from JSON: \(error)")
        }
    }

    private func saveState() {
        do {
            let state = ConversationState(selectedPartner: selectedPartner, currDialogID: currDialogID, userOptions: userOptions)
            let data = try JSONEncoder().encode(state)
            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Conversation.json") {
                try data.write(to: url)
            }
        } catch {
            print("Failed to save state to JSON: \(error)")
        }
    }

    private func loadState() {
        do {
            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Conversation.json") {
                let data = try Data(contentsOf: url)
                let state = try JSONDecoder().decode(ConversationState.self, from: data)
                selectedPartner = state.selectedPartner
                currDialogID = state.currDialogID
                userOptions = state.userOptions
            }
        } catch {
            print("Failed to load state from JSON: \(error)")
        }
    }

    func resetChatStorage() {
        histories.removeAll()
        userOptions.removeAll()
        saveHistoryToJSON()
        saveState()
    }

    func initialSetup() {
        loadJSONData()
        resetChatStorage()
        if let firstPartner = conversations.first?.partner_dialog {
            changeSelectedPartner(to: firstPartner)
        }
    }
}


