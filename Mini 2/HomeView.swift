import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
//            ZStack {
//                content
//            }
            ProfileView()
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
    // First Tab Image
    @State var selectedTab: String = "square.grid.3x3"
    
    // For Smooth Sliding Effect
    @Namespace var animation
    
    var body: some View {
        VStack{
            HStack(){
                Button(action: {}, label: {
                    Text("beautyjasmine")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .bold()
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 18))
                })
                

            }
            .padding([.horizontal, .top], 10)
//            .padding(.horizontal)
//            .padding(.top, 5) // Atur padding atas di sini
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack{
                    Divider()
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("profile1")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 20)
                       
//                        Spacer(minLength: 10)
                        
                        VStack(alignment:.leading, spacing: 4){
                            Text("Jasmine Thompson")
                                .bold()
                                .foregroundColor(.black)
                            Text("Beauty Vlogger")
                                .foregroundColor(.gray)
                            Text("20 y.o🫶🏻")
                            Text("Everything about make-up 💄")
                        }
                        
                    }
                    .padding([.horizontal, .top])
                    .padding(.bottom, 15)
                    
                    HStack{
                        VStack{
                            Text("79")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(.black)
                            
                            Text("Posts")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack{
                            Text("2M")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(.black)
                            
                            Text("Followers")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack{
                            Text("59")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(.black)
                            
                            Text("Following")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding([.horizontal, .top], 5)
                    
                    // Edit Profile
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Edit Profile")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                                )
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Promotions")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                                )
                        })
                    }
                    .padding([.horizontal, .top])
                    
                    HStack(spacing: 0){
                        TabBarButton(image: "square.grid.3x3.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                        
                        TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                    }
                    .frame(height: 70, alignment: .bottom)
                    
                    // tab view
                    ZStack{
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2, content: {
                            ForEach(1...20, id: \.self){index in
                                // for getting width for image
                                GeometryReader{ proxy in
                                    let width = proxy.frame(in: .global).width
                                    ImageView(index: index, width: width)
                                }
                                .frame(height: 120)
                            }
                        })
                    }
                }
            })
            
            
        }
    }
}

struct ImageView: View{
    var index: Int
    var width: CGFloat
    var body: some View{
        
        VStack{
            let imageName = index > 10 ? index - (10 * (index/10)) == 0 ? 10 :  index - (10 * (index/10)) :index
            Image("post\(imageName)")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: width, height: 120)
                .cornerRadius(0)
        }
        
    }
    
}

struct TabBarButton: View{
    var image: String
    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
       
        Button(action: {
            withAnimation(.easeInOut){
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 12){
                 (
                    isSystemImage ? Image(systemName: image) : Image(image)
                 )
                 .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 28, height: 28)
                 .foregroundColor(selectedTab == image ? .primary : .gray)
                
                ZStack{
                    if selectedTab == image{
                        Rectangle()
                            .fill(Color.primary)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    else {
                        Rectangle()
                            .fill(Color.clear)
                    }
                }
                .frame(height: 1)
            }
        })

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
