import Foundation

enum DMType {
    case rose
    case steph
    case natalie
    case stalker
}

class DMsViewModel: ObservableObject {
    @Published var chat: [DMsList] = []

    private let predefinedDMs: [DMType: (profilePicture: String, profileName: String, textMessage: String)] = [
        .rose: (profilePicture: "post9", profileName: "Rose", textMessage: "Hello from Rose!"),
        .steph: (profilePicture: "post9", profileName: "Steph", textMessage: "Hello from Steph!"),
        .natalie: (profilePicture: "post9", profileName: "Natalie", textMessage: "Hello from Natalie!"),
        .stalker: (profilePicture: "post9", profileName: "Stalker", textMessage: "Hello from Stalker!")
    ]

    func addDM(_ type: DMType) {
        if let dm = predefinedDMs[type] {
            let newMessage = DMsList(profilePicture: dm.profilePicture, profileName: dm.profileName, textMessage: dm.textMessage)
            chat.append(newMessage)
        }
    }
}
