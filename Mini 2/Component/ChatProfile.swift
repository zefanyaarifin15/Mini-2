import SwiftUI

struct ChatProfile: View {
    let profilePicture: String
    let profileName: String
    let checkMark: Bool
    
    var body: some View {
        HStack{
            HStack{
                Image(profilePicture)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                Text(profileName)
                    .bold()
                    .font(.system(size: 17))
                if checkMark{
                    Image("GreenCheckMark")
                }
            }            
            .padding(.trailing, 40)
            
            Spacer()
            
            Image("Phone")
                //.padding(.trailing, 5)
            
        }
    }
}
struct ChatProfile_Previews: PreviewProvider {
    static var previews: some View {
        ChatProfile(profilePicture: "James", profileName: "James Harrison", checkMark: true)
    }
}



