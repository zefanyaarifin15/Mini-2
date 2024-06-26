import SwiftUI

struct Episode4View: View {
    @State private var navigateToChat = false
    
    var body: some View {
        VStack {
            PhoneView().overlay {
                VStack {
                    MessageNotification(
                        image: "icon",
                        title: "Rose",
                        description: "I’m worried about you, are you alright? I’m here for you all the time.",
                        time: "19:00",
                        disableSecondNotification: true
                    )
                    Spacer()
                }
            }
            
            //ini bingung knp dia navigate ke post view?
            
            .background(
                NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Rose2"), isActive: $navigateToChat) {
                    EmptyView()
                }
                .hidden()
            )
            .onTapGesture {
                navigateToChat = true
            }
            
            //abis itu dia lgsg logout ig dari hp rose
            
        }
    }
}


struct Episode4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4View()
    }
}
