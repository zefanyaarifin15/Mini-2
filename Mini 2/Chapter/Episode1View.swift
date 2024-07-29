//import SwiftUI
//
//struct Episode1View: View {
//    @StateObject var notificationViewModel = NotificationViewModel(currentEpisode: 1)
//    @ObservedObject private var progress = UserProgress()
//    @State private var showPostView = false
//    @State private var showChatView = false
//    @State private var isSecondNotification = false
//    @State private var currentCounter: Int = 0
//
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    let targetPost: Post = Post(
//        username: "beautyjasmine",
//        caption: "beauty Mascara🫶🏻",
//        location: "Home",
//        postImage: "post1",
//        profileImage: "beautyjasmine",
//        initialLikes: 319872,
//        commentUser: "ShadowLurker",
//        commentText: "That lips look like pongo lips"
//    )
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                PhoneView()
//                MessageNotification(image: "Instaqueen", title: "Instaqueen", description: "222", time: "19:00")
//                
//                Text("Counter: \(progress.counter)") // Display the counter
//                    .font(.title)
//            }.onChange(of: progress.counter) { newValue in
//                currentCounter = newValue // Update local counter when progress.counter changes
//            }
//            
//
//
//                
////                VStack {
////                    PhoneView().overlay {
////                        VStack {
////                            if notificationViewModel.showNotification {
////                                MessageNotification(
////                                    image: "Instaqueen",
////                                    title: "InstaQueen",
////                                    description: "You got 1K+ comments on your latest post",
////                                    time: "19:00",
////                                    onSecondNotification: {
////                                        isSecondNotification = true
////                                    }
////                                )
////                                .onTapGesture {
////                                    if isSecondNotification {
////                                        showChatView = true
////                                    } else {
////                                        showPostView = true
////                                    }
////                                }
////                                .background(
////                                    NavigationLink(destination: PostView(
////                                        username: targetPost.username,
////                                        caption: targetPost.caption,
////                                        location: targetPost.location,
////                                        postImage: targetPost.postImage,
////                                        profileImage: targetPost.profileImage,
////                                        initialLikes: targetPost.initialLikes,
////                                        commentUser: targetPost.commentUser,
////                                        commentText: targetPost.commentText
////                                    ), isActive: $showPostView) { EmptyView() }
////                                )
////                                .background(
////                                    NavigationLink(destination: ChatView(viewModel: DialogViewModel(), partner: "Rose", profileName: "Rose"), isActive: $showChatView) { EmptyView() }
////                                )
////                            }
////                            Spacer()
////                        }
////                    }
////                }
//            
//        }
//    }
//}
//
import SwiftUI
import AVFoundation

struct Episode1View: View {
    @EnvironmentObject private var progress: UserProgress
    @State private var soundPlayed = false
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        NavigationView {
            ZStack {
                PhoneView()
                
//                Text("Counter: \(progress.counter)")
//                    .font(.title)
            
                
                if progress.counter == 0 {
                    MessageNotification(image: "Instaqueen", title: "Instaqueen", description: "You got 1K+ comments on your latest post", time: "19:00")
                        .onAppear{
                            soundPlayer.playSound(sound: "message_notif", type: "mp3")
                            //soundPlayed = true
                        }
                    
                }
                 
                if progress.counter == 1 {
                    MessageNotification(image: "Instaqueen", title: "Rose", description: "Hi there, how are you holding up today?", time: "19:00")

                        .onAppear{
                            soundPlayer.playSound(sound: "message_notif", type: "mp3")
                            //soundPlayed = true
                        }
                }

            }
           
        }
        .onAppear {
            progress.resetCounter()
            progress.loadCounter()
        }
    }
}

struct Episode1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1View()
            .environmentObject(UserProgress())
    }
}

/*
 fix logika alur episode:
 - masih hardcode
 */
