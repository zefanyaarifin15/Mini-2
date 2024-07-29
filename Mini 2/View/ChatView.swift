import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: DialogViewModel
    @EnvironmentObject private var progress: UserProgress
    
    var partner: String
    var profileName: String
    
    @State private var isLoading = false
    @State private var selectedOptionID: String?
    
    var body: some View {
        

        VStack(spacing: 0) {
            ReplyOptions(content: {
                historyFlow
                    .padding(.top, 10)
            }, content2: {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(viewModel.userOptions) { option in
                            Button(action: {
                                progress.incrementCounter()
                                selectedOptionID = option.id
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
                            
                        }
                    }
                    .padding()
                }
            })
            .onAppear {
                viewModel.changeSelectedPartner(to: partner)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ChatProfile(profilePicture: profileName, profileName: profileName, checkMark: true)
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }

    var historyFlow: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(viewModel.histories.filter { $0.partner == partner }) { history in
                    HStack {
                        if history.isUser {
                            if history.content != "- Ignore Chat -" {
                                OutgoingChatBubble(message: history.content)
                            }
                        } else {
                            if history.content == "VoiceNote" {
                                VNBubble(viewModel: SoundViewModel(), sound: Sound(id: "0", title: "Sound1", filename: "Sound1"))
                            } else if history.content == "HouseImage" {
                                PictureBubble()
                            } else {
                                IncomingChatBubble(message: history.content)
                            }
                        }
                    }
                    .padding([.leading, .trailing], 10)
                }
                
            }
            .padding(.top, 8)
        }
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: DialogViewModel(), partner: "ShadowLurker", profileName: "Stephanie").environmentObject(UserProgress()) 
    }
}

/*
ChatView:
 - tambahin delay 2 detik untuk munculin chat dari partnernya
 - tambahin animasi loading (maap kmrn ke delete buat debugging :" )
 - [line 23 - 41] Bikin kalau option.reply isinya "Ignore Chat", chat dari partner langsung muncul, 
   tanpa harus ada option untuk user klik button "Ignore Chat" dulu di ReplyOptions.
 */
