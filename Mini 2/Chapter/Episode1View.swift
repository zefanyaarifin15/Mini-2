import SwiftUI

struct Episode1View: View {
    @StateObject private var notificationViewModel = NotificationViewModel(currentEpisode: 1)
    @State private var showPostView = false
    @State private var showChatView = false
    @State private var isSecondNotification = false
    
    let targetPost: Post = Post(
        username: "beautyjasmine",
        caption: "beauty Mascara🫶🏻",
        location: "Home",
        postImage: "post1",
        profileImage: "beautyjasmine",
        initialLikes: 319872,
        commentUser: "ShadowLurker",
        commentText: "That lips look like pongo lips"
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    PhoneView().overlay {
                        VStack {
                            if notificationViewModel.showNotification {
                                MessageNotification(
                                    image: "icon",
                                    title: "QueensTagram",
                                    description: "You got 1K+ comments on your latest post",
                                    time: "19:00",
                                    onSecondNotification: {
                                        isSecondNotification = true
                                    }
                                )
                                .onTapGesture {
                                    if isSecondNotification {
                                                                           showChatView = true
                                                                       } else {
                                                                           showPostView = true
                                                                       }
                                }
                                .background(
                                    NavigationLink(destination: PostView(
                                        username: targetPost.username,
                                        caption: targetPost.caption,
                                        location: targetPost.location,
                                        postImage: targetPost.postImage,
                                        profileImage: targetPost.profileImage,
                                        initialLikes: targetPost.initialLikes,
                                        commentUser: targetPost.commentUser,
                                        commentText: targetPost.commentText
                                    ), isActive: $showPostView) { EmptyView() }
                                )
                                .background(
                                    NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Rose", profileName: "Rose"), isActive: $showChatView) { EmptyView() }
                                )
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
