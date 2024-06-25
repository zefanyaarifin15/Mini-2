////
////  Episode1View.swift
////  Mini 2
////
////  Created by Haliza Syafa Oktaviani on 25/06/24.
////
//
//import SwiftUI
//
//struct Episode1View: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                VStack {
//                    PhoneView().overlay{
//                        VStack{
//                            NavigationLink(destination: DMsView(viewModel: DialogViewModel(), viewModel_2: DMsViewModel())) {
//                                                        MessageNotification(image: "icon", title: "Stephanie", description: "You got 1K+ comments on your latest post", time: "19:00")
//                                                    }
//                            Spacer()
//                        }
//                    }
//                
//                    
//                }
//            }
////            .navigationBarTitle("Episode 1", displayMode: .inline)
//
//        }
//        
//    }
//}
//
//struct Episode1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Episode1View()
//    }
//}
//
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
        commentText: "That lips look like pongo lips"
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
