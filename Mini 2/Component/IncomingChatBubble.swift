import SwiftUI

struct IncomingChatBubble: View {
    let incomingBubble = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    let message: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("TailChatBubble")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(EdgeInsets(top: 0, leading: -5, bottom: -2, trailing: 0))
            Text(message)
                .font(.body)
                .foregroundColor(.white)
                .padding(10)
                .background(incomingBubble)
                .cornerRadius(16)
                .frame(maxWidth: 300, alignment: .leading)
        }
        .padding(.leading, 20)
    }
}

struct IncomingChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        IncomingChatBubble(message: "No, Jasmine. I'm not overreacting. Your interactions with her make me feel insecure, and I can't ignore it anymore.")
    }
}
