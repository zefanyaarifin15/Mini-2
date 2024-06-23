import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: DialogViewModel
    var partner: String

    var body: some View {
        VStack(spacing: 0) {
            if let options = viewModel.fetchUserOptions(for: partner, dialogID: viewModel.currDialogID) {
                ReplyOptions {
                    VStack(spacing: 8) {
                        Text("\(viewModel.currDialogID)")
                        ForEach(viewModel.histories) { history in
                            HStack {
                                if history.isUser {
                                    OutgoingChatBubble(message: history.content)
                                } else {
                                    IncomingChatBubble(message: history.content)
                                }
                            }
                            .padding([.leading, .trailing], 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                } content2: {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(options) { option in
                                Button(action: {
                                    viewModel.selectOption(option: option)
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
            viewModel.changeSelectedPartner(to: partner)
            viewModel.appendStartDialogHistory(for: partner)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                ChatProfile(profilePicture: "James", profileName: partner, checkMark: true)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: DialogViewModel(), partner: "Steph")
    }
}
