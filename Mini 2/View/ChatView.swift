import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: DialogViewModel
    var partner: String
    var profileName: String
    
    @State private var isLoading = false
    @State private var selectedOptionID: String?
    
    var body: some View {
        VStack(spacing: 0) {
            ReplyOptions {
                historyFlow
                    .padding(.top, 10)
            } content2: {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(viewModel.userOptions) { option in
                            Button(action: {
                                                            isLoading = true
                                                            selectedOptionID = option.id
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                                                viewModel.selectOption(optionID: option.id)
                                                                isLoading = false
                                                            }
                                                        }) {                                HStack {
                                    Spacer()
                                    Text(option.reply) // Display user's reply as the option text
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
            }
            .onAppear {
                viewModel.changeSelectedPartner(to: partner)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ChatProfile(profilePicture: "post9", profileName: profileName, checkMark: true)
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            
//            if isLoading {
//                AnimationView(name: "LoadingAnimation", animationSpeed: 1.0)
//                    .frame(width: 10, height: 10)
//            } else {
//                // Balasan pesan akan muncul di sini setelah 5 detik
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
        ChatView(viewModel: DialogViewModel(), partner: "Steph", profileName: "Stephanie")
    }
}
