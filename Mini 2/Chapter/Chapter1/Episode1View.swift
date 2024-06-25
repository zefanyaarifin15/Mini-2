import SwiftUI

struct Episode1View: View {
    @StateObject private var notificationViewModel = NotificationViewModel(currentEpisode: 1)
    
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
        NavigationView {
            ZStack {
                VStack {
                    PhoneView().overlay {
                        VStack {
                            if notificationViewModel.showNotification {
                                NavigationLink(destination: PostView(
                                    username: targetPost.username,
                                    caption: targetPost.caption,
                                    location: targetPost.location,
                                    postImage: targetPost.postImage,
                                    profileImage: targetPost.profileImage,
                                    initialLikes: targetPost.initialLikes,
                                    commentUser: targetPost.commentUser,
                                    commentText: targetPost.commentText
                                )) {
                                    MessageNotification(
                                        image: "icon",
                                        title: "Stephanie",
                                        description: "You got 1K+ comments on your latest post",
                                        time: "19:00"
                                    )
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct Episode1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1View()
    }
}
