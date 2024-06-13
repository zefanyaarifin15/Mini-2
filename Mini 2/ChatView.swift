import SwiftUI

struct ChatView: View {
    let chatRepository = ChatRepository.shared
    let conversations: [String]

    init() {
        // Fetch all conversations from the repository
        self.conversations = chatRepository.fetchAllConversations().keys.sorted()
    }

    var body: some View {
        TabView {
            ForEach(conversations, id: \.self) { partner in
                ConversationView(partner: partner)
                    .tabItem {
                        Text(partner)
                    }
            }
        }
        .padding()
    }
}

struct ConversationView: View {
    let chatRepository = ChatRepository.shared
    let partner: String
    @State private var messages: [ChatMessage] = []

    init(partner: String) {
        // Fetch messages for the specified partner from the repository
        self.partner = partner
        self._messages = State(initialValue: chatRepository.fetchMessages(for: partner) ?? [])
    }

    var body: some View {
        NavigationView {
            VStack {
                List(messages, id: \.id) { message in
                    MessageRow(message: message)
                }
                .listStyle(PlainListStyle()) // Use PlainListStyle for cleaner appearance
            }
            .navigationTitle(Text(partner))
        }
    }
}

struct MessageRow: View {
    let message: ChatMessage

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(message.sender)
                .font(.headline)
            Text(message.text)
                .foregroundColor(.secondary)
        }
        .padding(8)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
