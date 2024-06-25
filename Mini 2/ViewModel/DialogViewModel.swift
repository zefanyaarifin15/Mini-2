import SwiftUI

class DialogViewModel: ObservableObject {
    @Published var conversations: [PartnerConversation] = []
    @Published var histories: [History] = []
    @Published var selectedPartner: String = ""
    @Published var userOptions: [UserOption] = []
    @Published var currDialogID: Int = 1
    @Published var lastResponseText: String?

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
            let decodedData = try decoder.decode([String: PartnerConversation].self, from: data)
            conversations = Array(decodedData.values)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }

    func fetchPartners() -> [String] {
        conversations.map { $0.partner_dialog }
    }

    func changeSelectedPartner(to newPartner: String) {
        selectedPartner = newPartner
        loadHistoryFromJSON()
        loadStateFromJSON()

        if histories.isEmpty {
            appendStartDialogHistoryIfNeeded(for: newPartner)
        }

        if userOptions.isEmpty {
            userOptions = fetchUserOptions(for: newPartner, dialogID: currDialogID)
        }
    }

    func fetchUserOptions(for partner: String, dialogID: Int) -> [UserOption] {
        guard let conversation = conversations.first(where: { $0.partner_dialog == partner }) else {
            return []
        }

        if partner == "Rose" {
            return dialogID == 1 ? conversation.options ?? [] : findUserOptions(in: conversation.options ?? [], dialogID: dialogID)
        } else {
            return findDialogOptions(in: conversation.dialog ?? [], dialogID: dialogID)
        }
    }

    private func findUserOptions(in options: [UserOption], dialogID: Int) -> [UserOption] {
        guard let currentOption = options.first(where: { $0.id == "\(dialogID)" }) else {
            return []
        }
        return currentOption.response?.options ?? []
    }

    private func findDialogOptions(in dialogs: [Dialog], dialogID: Int) -> [UserOption] {
        guard let currentDialog = dialogs.first(where: { $0.id == dialogID }) else {
            return []
        }
        return currentDialog.user_options
    }

    func selectOption(optionID: String) {
        guard let selectedOption = userOptions.first(where: { $0.id == optionID }) else {
            print("Error: UserOption not found for ID \(optionID)")
            return
        }

        let userHistory = History(content: selectedOption.user_option, isUser: true, partner: selectedPartner)
        histories.append(userHistory)
        saveHistoryToJSON()

        if let responseText = selectedOption.response?.text {
            let responseHistory = History(content: responseText, isUser: false, partner: selectedPartner)
            histories.append(responseHistory)
            saveHistoryToJSON()
            lastResponseText = responseText
        } else {
            lastResponseText = nil
        }

        if let nextOptions = selectedOption.response?.options {
            currDialogID += 1
            userOptions = nextOptions
        } else {
            userOptions = []
        }
        saveStateToJSON()  // Save the current state after updating user options
    }

    private func appendStartDialogHistoryIfNeeded(for partner: String) {
        if histories.isEmpty {
            if let conversation = conversations.first(where: { $0.partner_dialog == partner }) {
                let startHistory = History(content: conversation.start_dialog, isUser: false, partner: partner)
                histories.append(startHistory)
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

    func resetChatStorage() {
        histories.removeAll()
        userOptions.removeAll()
        currDialogID = 1
        lastResponseText = nil

        saveHistoryToJSON()
        saveStateToJSON()
        
        // Reinitialize the dialog for the selected partner
        appendStartDialogHistoryIfNeeded(for: selectedPartner)
        userOptions = fetchUserOptions(for: selectedPartner, dialogID: currDialogID)
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

    func initialSetup() {
        loadJSONData()
        if let firstPartner = conversations.first?.partner_dialog {
            changeSelectedPartner(to: firstPartner)
        }
    }
}
