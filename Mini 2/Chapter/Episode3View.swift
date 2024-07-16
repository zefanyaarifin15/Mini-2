//import SwiftUI
//
//struct Episode3View: View {
//    @State private var showChatView = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                PhoneView().overlay {
//                    VStack {
//                        MessageNotification(
//                            image: "icon",
//                            title: "ShadowLurker",
//                            description: "I saw you go to work at 8 am today, you fucking piece of shit.",
//                            time: "18:00",
//                            disableSecondNotification: true
//                        )
//                        .onTapGesture {
//                            showChatView = true
//                        }
//                        Spacer()
//                    }
//                }
//            }
//            .background(
//                NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Stalker", profileName: "ShadowLurker"), isActive: $showChatView) {
//                    EmptyView()
//                }
//                .hidden()
//            )
//        }
//    }
//}
//
//struct Episode3View_Previews: PreviewProvider {
//    static var previews: some View {
//        Episode3View()
//    }
//}
//
