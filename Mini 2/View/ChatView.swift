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
            //.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            
//             //Optional: Handle isLoading and selectedOptionID display
            if isLoading {
                AnimationView(name: "LoadingAnimation", animationSpeed: 1.0)
                    .frame(width: 10, height: 10)
            } //else {
//                if let optionID = selectedOptionID {
//                    Text("Reply: \(viewModel.userOptions.first { $0.id == optionID }?.reply ?? "")")
//                        .padding()
//                }
//            }
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
                
                // Display loading animation if isLoading is true
                if isLoading {
                    HStack {
                        AnimationView(name: "LoadingAnimation", animationSpeed: 1.0)
                            .frame(width: 50, height: 50)
                        Spacer()
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
