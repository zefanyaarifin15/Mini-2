import SwiftUI

struct OutgoingChatBubble: View {
    let outgoingBubble = Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
    let message: String

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("OutTailChatBubble")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -2, trailing: -5))
            Text(message)
                .font(.body)
                .foregroundColor(.white)
                .padding(10)
                .background(outgoingBubble)
                .cornerRadius(16)
                .frame(maxWidth: 300, alignment: .leading)
        }
        .padding(.trailing, 20)
    }
}

struct OutgoingChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        OutgoingChatBubble(message: "Jasmine, it’s not just about working on it. It's about how I feel when I see you with Stephani or any other girl. I can't keep feeling this way.")
    }
}
