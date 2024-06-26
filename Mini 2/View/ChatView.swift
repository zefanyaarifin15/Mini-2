//import SwiftUI
//
//struct ChatView: View {
//    @ObservedObject var viewModel: DialogViewModel
//    var partner: String
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ReplyOptions {
//                historyFlow
//                    .padding(.top, 10)
//            } content2: {
//                ScrollView {
//                    VStack(spacing: 8) {
//                        ForEach(viewModel.userOptions) { option in
//                            Button(action: {
//                                viewModel.selectOption(optionID: option.id)
//                            }) {
//                                HStack {
//                                    Spacer()
//                                    Text(option.reply) // Display user's reply as the option text
//                                        .foregroundColor(.white)
//                                        .padding()
//                                        .background(Color.gray)
//                                        .cornerRadius(8)
//                                        .multilineTextAlignment(.center)
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .onAppear {
//                viewModel.changeSelectedPartner(to: partner)
//            }
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    ChatProfile(profilePicture: "post9", profileName: partner, checkMark: true)
//                }
//            }
//            .toolbar(.hidden, for: .tabBar)
//            .navigationBarTitleDisplayMode(.inline)
//            //.navigationBarBackButtonHidden(true)
//            .edgesIgnoringSafeArea(.bottom)
//        }
//    }
//
//    var historyFlow: some View {
//        ScrollView {
//            VStack(spacing: 8) {
//                ForEach(viewModel.histories) { history in
//                    HStack {
//                        if history.isUser {
//                            OutgoingChatBubble(message: history.content)
//                        } else {
//                            switch history.content {
//                            case "VoiceNote":
//                                VNBubble(viewModel: SoundViewModel(), sound: Sound(id: "0", title: "Sound1", filename: "Sound1"))
//                            case "HouseImage":
//                                PictureBubble()
//                            default:
//                                IncomingChatBubble(message: history.content)
//                            }
//                        }
//                    }
//                    .padding([.leading, .trailing], 10)
//                }
//            }
//            .padding(.top, 8)
//        }
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView(viewModel: DialogViewModel(), partner: "Steph")
//    }
//}

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: DialogViewModel
    var partner: String

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
                                viewModel.selectOption(optionID: option.id)
                            }) {
                                HStack {
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
                    ChatProfile(profilePicture: "post9", profileName: partner, checkMark: true)
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
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
            }
            .padding(.top, 8)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: DialogViewModel(), partner: "Steph")
    }
}
