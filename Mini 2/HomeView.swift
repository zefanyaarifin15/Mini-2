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
                
//                Button{
//
//                } label: {
//                    Image(systemName: "heart")
//                        .resizable()
//                        .foregroundColor(.black)
//                        .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
//                }
//
//                Button{
//
//                } label: {
//                    Image(systemName: "message")
//                        .resizable()
//                        .foregroundColor(.black)
//                        .frame(minWidth: 20, maxWidth: 20, minHeight: 20, maxHeight: 20)
//                }
//                .padding(.trailing, 10)
            }
            Divider()
            
        }
    }
    
    var myStory: some View{
        HStack{
            VStack{
                ZStack(alignment: .bottomTrailing){
                    Image("story")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 62, maxWidth: 62, minHeight: 62, maxHeight: 62)
                        .cornerRadius(100)
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                
                Text("Your Story")
                    .font(.system(size: 13))
            }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
    
    var otherStory: some View{
        HStack{
            VStack{
                Button{
                    
                } label: {
                    Image("story")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 62, maxWidth: 62, minHeight: 62, maxHeight: 62)
                        .cornerRadius(100)
                        .overlay(RoundedRectangle(cornerRadius: 100)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/), lineWidth: 3)
                        )
                }
                
                Text("nataliebert")
                    .frame(minWidth:65, maxWidth: 65)
                    .font(.system(size: 13))
            }
        }
    }
    
    var feeds: some View{
        VStack(){
            HStack(alignment: .top){
                Image("profile1")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
                    .cornerRadius(100)
                
                VStack(alignment: .leading){
                    Text("beautyjasmine")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .bold()
                    
                    Text("Location")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(.top, 3)
               Spacer()
                
                Button{
                    
                } label: {
                   Image("dots")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 15)
                        .padding(.top, 5)
                }
            }
            .padding(.leading, 15)
            .padding(.bottom, 5)
            
            ZStack(alignment: .topLeading){
                Image("feeds1")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.trailing, 15)
                    .padding(.leading, 15)
            }
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing: 30){
                    Button{
                        print("liked photos")
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25)
                    }
                    
                    Button{
                        print("liked photos")
                    } label: {
                        Image(systemName: "ellipsis.bubble")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 18)
                
                Text("11.926 others")
                    .font(.system(size: 16))
                    .bold()
                    .padding(.leading, 18)
                    .padding(.top, 10)
                
                HStack{
                    Text("beautyjasmine")
                        .font(.system(size: 16))
                        .bold()
                        .padding(.leading, 18)
                        .padding(.top, 5)
                    
                    Text("Spending this weekend..")
                        .font(.system(size: 16))
                        .padding(.top, 5)
                    
                    Text("more")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
                
                Button{
                    
                } label: {
                    Text("View all comments")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.leading, 18)
                }
                .padding(.top, 3)
                
                Button{
                   
                } label: {
                    HStack{
                        Text("ShadowLurker")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .bold()
                            .padding(.leading, 18)
                        
                        Text("That lips look like pongo lips")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            
                    }
                    
                }
                
            }
        }
    }
}

// pindah ke DMsView -A
//
//struct ChatView2: View {
//    var body: some View {
//        Text("Chat View")
//    }
//}

struct ReportView: View {
    var body: some View {
        Text("Report View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
