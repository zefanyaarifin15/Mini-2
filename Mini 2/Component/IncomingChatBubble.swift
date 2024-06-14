import SwiftUI

struct IncomingChatBubble: View {
    let incomingBubble = Color(#colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9215686275, alpha: 1))
    let message: String
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Image("TailChatBubble")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 0, leading: -5, bottom: -2, trailing: 0))
                Text(message)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(incomingBubble)
                    .cornerRadius(16)
                    .frame(maxWidth: 270, alignment: .leading)
            }
            Spacer()
        }
 
    }
}

struct IncomingChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        IncomingChatBubble(message: "No, Jasmine. I'm not overreacting. Your interactions with her make me feel insecure, and I can't ignore it anymore.")
    }
}
