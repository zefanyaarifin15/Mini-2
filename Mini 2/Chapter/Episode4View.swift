import SwiftUI

struct Episode4View: View {
    @State private var showChatView = false

    var body: some View {
        NavigationView {
            VStack {
                PhoneView().overlay {
                    VStack {
                        MessageNotification(
                            image: "Instaqueen",
                            title: "Rose",
                            description: "I’m worried about you, are you alright? I’m here for you all the time.",
                            time: "20:00",
                            disableSecondNotification: true
                        )
                        .onTapGesture {
                            showChatView = true
                        }
                        Spacer()
                    }
                }
            }
            .background(
                NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Rose2", profileName: "Rose"), isActive: $showChatView) {
                    EmptyView()
                }
                .hidden()
            )
            
            //dia bakal logout ig dari hp rose (ini liat di task list)
        }
    }
}


struct Episode4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4View()
    }
}
