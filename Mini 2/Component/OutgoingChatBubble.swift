import SwiftUI

struct OutgoingChatBubble: View {
    let message: String

    var body: some View {
        HStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
                Image("OutTailChatBubble")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -2, trailing: -5))
                    
                Text(message)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.greenInstaQ)
                    .cornerRadius(16)
                    .frame(maxWidth: 270, alignment: .trailing)
            }
        }
        
    }
}

struct OutgoingChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        OutgoingChatBubble(message: "Jasmine, it’s not just about working on it. It's about how I feel when I see you with Stephani or any other girl. I can't keep feeling this way.")
    }
}
