import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: DialogViewModel
    var partner: String
    
    // UserOptions yang cuman respond stalker tanpa user reply
    let skipUserOptionIDs: Set<String> = ["1a", "3a", "5a", "7a", "8a", "9a", "10a", "12a"]

    var body: some View {
        VStack(spacing: 0) {
            if !viewModel.userOptions.isEmpty {
                ReplyOptions { // View atas
                    historyFlow
                        .padding(.top, 10)
                } content2: { // View bawah atau drawer
                    ScrollView {
                        VStack(spacing: 8) {
                            
                            // Untuk show reply options yang ada sesuai dialog
                            ForEach(viewModel.userOptions) { option in
                                Button(action: {
                                    viewModel.selectOption(optionID: option.id)
                                }) {
                                    HStack {
                                        Spacer()
                                        Text(option.reply)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.gray)
                                            .cornerRadius(8)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(minHeight: 40)
                            }
                        }
                        .padding()
                    }
                }
            } else {
                Text("Loading...")
                    .padding()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.changeSelectedPartner(to: partner) // ganti partner sesuai DMsView
            viewModel.appendStartDialogHistory(for: partner)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                ChatProfile(profilePicture: "James", profileName: partner, checkMark: true)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // untuk kontrol bubble yang muncul di chat
    var historyFlow: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.histories) { history in
                HStack {
                    if history.isUser {
                        OutgoingChatBubble(message: history.content)
                    } else {
                        switch history.content {
                        case "VoiceNote":
                            VNBubble(viewModel: SoundViewModel(), sound: Sound(id: "0", title: "Sound1", filename: "Sound1"))
                        case "HouseImage":
                            PictureBubble()
                        default:
                            IncomingChatBubble(message: history.content)
                        }
                    }
                }
                .padding([.leading, .trailing], 10)
            }
            Spacer()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: DialogViewModel(), partner: "Stalker")
    }
}
