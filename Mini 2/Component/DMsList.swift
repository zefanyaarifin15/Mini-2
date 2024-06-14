import SwiftUI

struct DMsList: View {
    let profilePicture: String
    let profileName: String
    let timeMessage: String
    let textMessage: String
    
    var body: some View {
        
        HStack {
            Image(profilePicture)
                .resizable()
                .clipShape(Circle())
                .frame(width: 45, height: 45)
            VStack(alignment: .leading) {
                HStack{
                    Text(profileName)
                        .bold()
                        .font(.system(size: 18))
                    Spacer()
                    Text(timeMessage)
                        .foregroundColor(.grayInstaQ)
                        .font(.system(size: 15))
                }
                Text(textMessage)
                    .lineLimit(2)
                    .foregroundColor(.grayInstaQ)
                    .font(.system(size: 15))
                    
                
            }
        }
    }
}

struct DMsList_Previews: PreviewProvider {
    static var previews: some View {
        DMsList(profilePicture: "James", profileName: "James Harrison", timeMessage: "1.20 PM", textMessage: "<3")
    }
}
