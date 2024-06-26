//
//  Episode7View.swift
//  Mini 2
//
//  Created by Natasha Radika on 26/06/24.
//

import SwiftUI

struct Episode7View: View {
    
    @ObservedObject var viewModel_2: DMsViewModel
    
    @State private var showChatView = false
    @State private var showSecondNotification = false
    
    let targetPost: Post = Post(
        username: "ShadowLurker",
        caption: "Only idiots use this crappy products",
        location: "Science Lab",
        postImage: "feeds1",
        profileImage: "Stalker",
        initialLikes: 123,
        commentUser: "user123",
        commentText: "No beauty influencer to be trusted.."
    )
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    PhoneView().overlay {
                        VStack {
                            if !showChatView {
                                Button(action: {
                                    showChatView = true
                                    showSecondNotification = true // Show second notification when navigating to chat
                                }) {
                                    MessageNotification(
                                        image: "icon",
                                        title: "Fans",
                                        description: "Hi, have you seen this post?",
                                        time: "now",
                                        disableSecondNotification: true
                                    )
                                }
                                .sheet(isPresented: $showChatView) {
                                    ChatView(viewModel: DialogViewModel(), partner: "Fans", profileName: "Jenna")
                                }
                            } else {
                                if showSecondNotification {
                                    NavigationLink(
                                        destination: PostView(
                                            username: targetPost.username,
                                            caption: targetPost.caption,
                                            location: targetPost.location,
                                            postImage: targetPost.postImage,
                                            profileImage: targetPost.profileImage,
                                            initialLikes: targetPost.initialLikes,
                                            commentUser: targetPost.commentUser,
                                            commentText: targetPost.commentText
                                        )
                                    ) {
                                        MessageNotification(
                                            image: "icon",
                                            title: "InstaQueen",
                                            description: "ShadowLurker posted something new",
                                            time: "now",
                                            disableSecondNotification: true
                                        )
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel_2.addNextDM()
        }
    }
}



#Preview {
    Episode7View(viewModel_2: DMsViewModel())
}
