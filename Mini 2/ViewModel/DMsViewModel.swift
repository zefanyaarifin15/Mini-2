import Foundation
import SwiftData
import SwiftUI

enum DMType: CaseIterable {
    case james
    case rose
    case steph
    case natalie
    case stalker
}

// ProfileList now matches the structure of DMsList
@Model
class ProfileList: Identifiable {
    var id: String
    var profilePicture: String
    var profileName: String
    
    init(id: String, profilePicture: String, profileName: String) {
        self.id = id
        self.profilePicture = profilePicture
        self.profileName = profileName
    }
}

class DMsViewModel: ObservableObject {
    @Published var chat: [DMsList] = []
    @Environment(\.modelContext) private var context
    @Query private var lists: [ProfileList]
    
    private var currentIndex = 0
    
    private let predefinedDMs: [DMType: (profilePicture: String, profileName: String, textMessage: String)] = [
        .james: (profilePicture: "James", profileName: "James", textMessage: "Hello from James!"),
        .rose: (profilePicture: "Rose", profileName: "Rose", textMessage: "Hello from Rose!"),
        .steph: (profilePicture: "Stephanie", profileName: "Stephanie", textMessage: "Hello from Steph!"),
        .natalie: (profilePicture: "Natalie", profileName: "Natalie", textMessage: "Hello from Natalie!"),
        .stalker: (profilePicture: "ShadowLurker", profileName: "ShadowLurker", textMessage: "Hello from Stalker!")
    ]

    // Function to add next DM to chat
    func addNextDM() {
        guard currentIndex < DMType.allCases.count else {
            return
        }
        
        let dmType = DMType.allCases[currentIndex]
        if let dm = predefinedDMs[dmType] {
            let newMessage = DMsList(profilePicture: dm.profilePicture, profileName: dm.profileName, textMessage: dm.textMessage)
            chat.append(newMessage)
            //context.insert(newMessage)
            currentIndex += 1
        }
    }
    
    // Function to add a profile to lists
    func keepProfileList() {
        // Example to insert a profile into the context
        let profile = ProfileList(id: UUID().uuidString, profilePicture: "Default", profileName: "New Profile")
        context.insert(profile)
    }
}
