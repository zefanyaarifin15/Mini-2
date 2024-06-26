import SwiftUI

struct Episode5View: View {
    @StateObject private var notificationViewModel = NotificationViewModel(currentEpisode: 5)
    @State private var showChatView = false
    @State private var showPostView = false
    @State private var isSecondNotification = false
    
    let nataliePost: Post = Post(
        username: "natalie",
        caption: "Girls night out!",
        location: "City Center",
        postImage: "girls_night_out",
        profileImage: "natalie_profile",
        initialLikes: 1024,
        commentUser: "anonim",
        commentText: "@jasmine natalie is copying u!"
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
                                    title: isSecondNotification ? "anonim" : "Natalie",
                                    description: isSecondNotification ? "@jasmine natalie is copying!" : "How about a girls night out?",
                                    time: "20:00",
                                    onSecondNotification: {
                                        isSecondNotification = true
                                      
                                        notificationViewModel.showNotification = false
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            notificationViewModel.showNotification = true
                                        }
                                    }
                                )
                                .onTapGesture {
                                    if isSecondNotification {
                                        showPostView = true
                                    } else {
                                        showChatView = true
                                    }
                                }
                                .background(
                                    NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Natalie"), isActive: $showChatView) { EmptyView() }
                                )
                                .background(
                                    NavigationLink(destination: PostView(
                                        username: nataliePost.username,
                                        caption: nataliePost.caption,
                                        location: nataliePost.location,
                                        postImage: nataliePost.postImage,
                                        profileImage: nataliePost.profileImage,
                                        initialLikes: nataliePost.initialLikes,
                                        commentUser: nataliePost.commentUser,
                                        commentText: nataliePost.commentText
                                    ), isActive: $showPostView) { EmptyView() }
                                )
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            notificationViewModel.showNotification = true
        }
    }
}

struct Episode5View_Previews: PreviewProvider {
    static var previews: some View {
        Episode5View()
    }
}
