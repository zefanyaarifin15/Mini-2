import SwiftUI

struct JamesChatView: View {
    let chatRepository = ChatRepository.shared
    let partner: String
    @State private var jamesMessages: [(String, String)] = []

    var body: some View {
        VStack {
            List(jamesMessages, id: \.1) { message in
                MessageBubble(sender: message.0, text: message.1)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .padding(-10)
        }
        .onAppear {self.loadMessages()}
        .toolbar {
            ToolbarItem(placement: .principal) {
                ChatProfile(profilePicture: partner, profileName: partner, checkMark: true)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        //.navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func loadMessages() {
        self.jamesMessages = chatRepository.fetchMessages(for: partner) ?? []
    }
    
}

struct MessageBubble: View {
    let sender: String
    let text: String

    var body: some View {
        if(sender != "Girlfriend"){
            IncomingChatBubble(message: text)
        }else{
            OutgoingChatBubble(message: text)
        }
        
    }
}

struct JamesChatView_Previews: PreviewProvider {
    static var previews: some View {
        JamesChatView(partner: "James")
    }
}

