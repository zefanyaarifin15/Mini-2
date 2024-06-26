import Foundation

enum DMType: CaseIterable {
    case james
    case rose
    case steph
    case natalie
    case stalker
}

class DMsViewModel: ObservableObject {
    @Published var chat: [DMsList] = []
    private var currentIndex = 0
    
    private let predefinedDMs: [DMType: (profilePicture: String, profileName: String, textMessage: String)] = [
        .james: (profilePicture: "James", profileName: "James", textMessage: "Hello from James!"),
        .rose: (profilePicture: "Rose", profileName: "Rose", textMessage: "Hello from Rose!"),
        .steph: (profilePicture: "Stephanie", profileName: "Steph", textMessage: "Hello from Steph!"),
        .natalie: (profilePicture: "Natalie", profileName: "Natalie", textMessage: "Hello from Natalie!"),
        .stalker: (profilePicture: "Stalker", profileName: "Stalker", textMessage: "Hello from Stalker!")
    ]

    func addNextDM() {
        guard currentIndex < DMType.allCases.count else {
            return
        }
        
        let dmType = DMType.allCases[currentIndex]
        if let dm = predefinedDMs[dmType] {
            let newMessage = DMsList(profilePicture: dm.profilePicture, profileName: dm.profileName, textMessage: dm.textMessage)
            chat.append(newMessage)
            currentIndex += 1
        }
    }
}
