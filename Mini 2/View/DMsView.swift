//import SwiftUI
//
//struct DMsView: View {
//    let chatRepository = ChatRepository.shared
//    let conversations: [String]
//
//    init() {
//        self.conversations = chatRepository.fetchAllConversations().keys.sorted()
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(conversations, id: \.self) { partner in
//                    NavigationLink(destination: ChatView(partner: partner)) {
//                        if let lastMessage = chatRepository.fetchLastMessage(for: partner) {
//                            DMsList(profilePicture: "James", profileName: partner, timeMessage: "1.20 PM", textMessage: lastMessage.1)
//                        } else {
//                            DMsList(profilePicture: "James", profileName: partner, timeMessage: "", textMessage: "No messages yet")
//                        }
//                    }
//                }
//                .listStyle(.grouped)
//                .scrollContentBackground(.hidden)
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Text("beautyjasmine")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(.primary)
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct DMsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DMsView()
//    }
//}
