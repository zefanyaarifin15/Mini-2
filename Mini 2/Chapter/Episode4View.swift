import SwiftUI

struct Episode4View: View {
    let targetPost: Post = Post(
        username: "beautyjasmine",
        caption: "My niece is so cute",
        location: "Home",
        postImage: "feeds1",
        profileImage: "beautyjasmine",
        initialLikes: 319872,
        commentUser: "ShadowLurker",
        commentText: "You're nothing but a fake"
    )
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    PhoneView().overlay{
                        VStack{
                            MessageNotification(
                                image: "icon",
                                title: "Rose",
                                description: "I’m worried about you, are you alright? I’m here for you all the time.",
                                time: "19:00",
                                disableSecondNotification: true
                            )
                            Spacer()
                        }
                        //ntr abis di klik notif nya munculin chat dm dia sama rose
                        
                        //logout dari ig jasmine di hp user (belum bikin UI seolah dia nge logout dari hp jasmine)
                    }
                }
            }
        }
    }
}

struct Episode4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4View()
    }
}
