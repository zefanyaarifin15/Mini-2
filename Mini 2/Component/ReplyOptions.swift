import SwiftUI

struct ReplyOptions: View {
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.greenInstaQ)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 36)
                .padding(.vertical, 20)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 36)
                
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 36)
                
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 36)
              
            
                
            
                
        }
        .padding(5)
        .background(.grayInstaQ)
        .cornerRadius(20)
        .frame(maxHeight: 500)
    }
}

#Preview {
    ReplyOptions()
}
/*
 Stephanie: Hi, Jasmine! How are you?
 Jasmine:
 (reply option 1) Hi, Alice! I'm great! How about you?
 (reply option 2) I'm doing wonderful! Thanks for asking.
 (reply option 3) I’m great, thanks!
 Stephanie: I'm doing well! Thanks for asking. By the way, I’m throwing a birthday party this weekend at Hotel Merlian. Would you like to come?
 */
