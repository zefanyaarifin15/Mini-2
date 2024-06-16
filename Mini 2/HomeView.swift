import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ZStack {
                content
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
                   
            DMsView()
                .tabItem {
                    Label("Chat", systemImage: "ellipsis.message.fill")
                }
                   
            ReportView()
                .tabItem {
                    Label("Report", systemImage: "list.clipboard.fill")
                }
                   
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
            }
        }
    
    var content: some View{
        VStack{
            navigationBar
            ScrollView{
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                           
                        }
                    }
                    feeds
                }
            }
        }
    }
    
    var navigationBar: some View{
        VStack{
            HStack{
                Image("Logo IG")
                    .resizable()
                    .frame(width: 100, height: 50) // Sesuaikan ukuran sesuai kebutuhan
                    .padding(.leading, 15) // Tambahkan padding untuk menempatkan logo di pojok kiri
                    Spacer()
            }
            Divider()
            
        }
    }
    
    var feeds: some View{
        VStack(spacing: 30) {
            PostView(username: "beautyjasmine", caption: "My niece is so cute", location: "Home", postImage: "feeds1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips")
            
            PostView(username: "nataliebert", caption: "Great holiday", location: "Paris", postImage: "post4", profileImage: "nataliebert", initialLikes: 12898, commentUser: "beautyjasmine", commentText: "So stunning😍")
            
            PostView(username: "stephaniejenn", caption: "Loving my make up today🫶🏻", location: "Studio", postImage: "stephaniejenn", profileImage: "stephaniejenn", initialLikes: 51530, commentUser: "beautyjasmine", commentText: "My pretty bestie😍")
            
            PostView(username: "rosemisela", caption: "Candid looks", location: "Lucy Cafe", postImage: "feedsrose", profileImage: "rosemisela", initialLikes: 9240, commentUser: "beautyjasmine", commentText: "😍🫶🏻")
        }

    }
}


struct ReportView: View {
    var body: some View {
        Text("Report View")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
