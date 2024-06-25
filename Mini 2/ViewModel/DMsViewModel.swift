import Foundation


class DMsViewModel: ObservableObject {
    @Published var chat: [DMsList] = [
        DMsList(profilePicture: "post9", profileName: "Rose", textMessage: ""),
        DMsList(profilePicture: "post9", profileName: "Steph", textMessage: ""),
    ]
    
    func addDM(profilePicture: String, profileName: String, textMessage: String) {
        let newMessage = DMsList(profilePicture: profilePicture, profileName: profileName, textMessage: textMessage)
        chat.append(newMessage)
    }
}
