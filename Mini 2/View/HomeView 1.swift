//
//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        TabView {
//            ZStack {
//                content
//            }
//            .tabItem {
//                Label("Home", systemImage: "house")
//            }
//                   
//            DMsView()
//                .tabItem {
//                    Label("Chat", systemImage: "ellipsis.message.fill")
//                }
//                   
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person.circle.fill")
//                }
//            }
//        }
//    
//    var content: some View{
//        VStack{
//            navigationBar
//            ScrollView{
//                VStack{
//                    ScrollView(.horizontal, showsIndicators: false){
//                        HStack(spacing: 20){
//                           
//                        }
//                    }
//                    feeds
//                }
//            }
//        }
//    }
//    
//    var navigationBar: some View{
//        VStack{
//            HStack{
//                Image("Logo IG")
//                    .resizable()
//                    .frame(width: 100, height: 50) // Sesuaikan ukuran sesuai kebutuhan
//                    .padding(.leading, 15) // Tambahkan padding untuk menempatkan logo di pojok kiri
//                    Spacer()
//            }
//            Divider()
//            
//        }
//    }
//    
//    var feeds: some View{
//        VStack(spacing: 30) {
//            PostView(username: "beautyjasmine", caption: "My niece is so cute", location: "Home", postImage: "feeds1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips")
//            
//            PostView(username: "nataliebert", caption: "Great holiday", location: "Paris", postImage: "post4", profileImage: "nataliebert", initialLikes: 12898, commentUser: "beautyjasmine", commentText: "So stunning😍")
//            
//            PostView(username: "stephaniejenn", caption: "Loving my make up today🫶🏻", location: "Studio", postImage: "stephaniejenn", profileImage: "stephaniejenn", initialLikes: 51530, commentUser: "beautyjasmine", commentText: "My pretty bestie😍")
//            
//            PostView(username: "rosemisela", caption: "Candid looks", location: "Lucy Cafe", postImage: "feedsrose", profileImage: "rosemisela", initialLikes: 9240, commentUser: "beautyjasmine", commentText: "😍🫶🏻")
//        }
//
//    }
//}
//
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            ZStack {
                content
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
                   
            DMsView(viewModel: DialogViewModel(), viewModel_2: DMsViewModel())
                .tabItem {
                    Label("Chat", systemImage: "ellipsis.message.fill")
                }
                   
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
    
    var content: some View {
        VStack {
            navigationBar
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Add any additional content for the horizontal scroll view here
                        }
                    }
                    feeds
                }
            }
        }
    }
    
    var navigationBar: some View {
        VStack {
            HStack {
                Image("Logo IG")
                    .resizable()
                    .frame(width: 100, height: 50) // Sesuaikan ukuran sesuai kebutuhan
                    .padding(.leading, 15) // Tambahkan padding untuk menempatkan logo di pojok kiri
                Spacer()
            }
            Divider()
        }
    }
    
    var feeds: some View {
        VStack(spacing: 30) {
            ForEach(viewModel.posts) { post in
                PostView(
                    username: post.username,
                    caption: post.caption,
                    location: post.location,
                    postImage: post.postImage,
                    profileImage: post.profileImage,
                    initialLikes: post.initialLikes,
                    commentUser: post.commentUser,
                    commentText: post.commentText
                )
            }
            // Add New Post Button
            Button(action: {
                viewModel.addPost(
                    username: "newuser",
                    caption: "New Post Caption",
                    location: "New Location",
                    postImage: "newpostimage",
                    profileImage: "newprofileimage",
                    initialLikes: 0,
                    commentUser: "newcommentuser",
                    commentText: "New comment text"
                )
            }) {
                Text("Add New Post")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
