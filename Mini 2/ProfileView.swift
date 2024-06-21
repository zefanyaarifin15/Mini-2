////
////  ProfileView.swift
////  Mini 2
////
////  Created by Jasmine Mutia Alifa on 17/06/24.
////
//
//import SwiftUI
//
//struct ProfileView: View {
//    // First Tab Image
//    @State var selectedTab: String = "square.grid.3x3"
//    
//    // For Smooth Sliding Effect
//    @Namespace var animation
//    
//    var body: some View {
//        NavigationView {
//        VStack{
//            HStack(){
//                Spacer()
//                Button(action: {}, label: {
//                    Text("beautyjasmine")
//                        .font(.system(size: 18))
//                        .foregroundColor(.black)
//                        .bold()
//                    
//                    Image(systemName: "checkmark.seal.fill")
//                        .foregroundColor(.green)
//                        .font(.system(size: 18))
//                })
//                Spacer() // Menambahkan spacer untuk mendorong tombol "Settings" ke kanan
//                    
//                NavigationLink(destination: SettingsView()) {
//                        Image(systemName: "gearshape")
//                            .foregroundColor(.black)
//                            .font(.system(size: 18))
//                    }
//
//            }
//            .padding([.horizontal, .top], 10)
////            .padding(.horizontal)
////            .padding(.top, 5) // Atur padding atas di sini
//            ScrollView(.vertical, showsIndicators: false, content: {
//                VStack{
//                    Divider()
//                    HStack{
//                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                            Image("beautyjasmine")
//                                .resizable()
//                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                                .frame(width: 100, height: 100)
//                                .clipShape(Circle())
//                        })
//                        .padding(.trailing, 20)
//                       
////                        Spacer(minLength: 10)
//                        
//                        VStack(alignment:.leading, spacing: 4){
//                            Text("Jasmine Thompson")
//                                .bold()
//                                .foregroundColor(.black)
//                            Text("Beauty Vlogger")
//                                .foregroundColor(.gray)
//                            Text("20 y.o🫶🏻")
//                            Text("Everything about make-up 💄")
//                        }
//                        
//                    }
//                    .padding([.horizontal, .top])
//                    .padding(.bottom, 15)
//                    
//                    HStack{
//                        VStack{
//                            Text("79")
//                                .font(.system(size: 22))
//                                .bold()
//                                .foregroundColor(.black)
//                            
//                            Text("Posts")
//                        }
//                        .frame(maxWidth: .infinity)
//                        
//                        VStack{
//                            Text("2M")
//                                .font(.system(size: 22))
//                                .bold()
//                                .foregroundColor(.black)
//                            
//                            Text("Followers")
//                        }
//                        .frame(maxWidth: .infinity)
//                        
//                        VStack{
//                            Text("59")
//                                .font(.system(size: 22))
//                                .bold()
//                                .foregroundColor(.black)
//                            
//                            Text("Following")
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                    .padding([.horizontal, .top], 5)
//                    
//                    // Edit Profile
//                    HStack{
//                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                            Text("Edit Profile")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.primary)
//                                .padding(.vertical, 10)
//                                .frame(maxWidth: .infinity)
//                                .background(
//                                           Color.gray.opacity(0.3)
//                                       )
//                                       .cornerRadius(4) // Menambahkan corner radius pada latar belakang abu-abu
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 4)
//                                    .stroke(Color.gray.opacity(0.3)) // Mengatur garis tepi abu-abu
//                                       )
//                                      
//                        })
//                        
//                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                            Text("Promotions")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.primary)
//                                .padding(.vertical, 10)
//                                .frame(maxWidth: .infinity)
//                                .background(
//                                           Color.gray.opacity(0.3)
//                                       )
//                                       .cornerRadius(4) // Menambahkan corner radius pada latar belakang abu-abu
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 4)
//                                    .stroke(Color.gray.opacity(0.3)) // Mengatur garis tepi abu-abu
//                                )
//                        })
//                    }
//                    .padding([.horizontal, .top])
//                    
//                    HStack(spacing: 0){
//                        TabBarButton(image: "square.grid.3x3.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
//                        
//                        TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
//                    }
//                    .frame(height: 70, alignment: .bottom)
//                    
//                    // tab view
//                    ZStack{
//                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2, content: {
//                            ForEach(1...20, id: \.self){index in
//                                // for getting width for image
//                                GeometryReader{ proxy in
//                                    let width = proxy.frame(in: .global).width
//                                    ImageView(index: index, width: width)
//                                }
//                                .frame(height: 120)
//                            }
//                        })
//                    }
//                }
//            })
//            
//            
//        }
//       
//    }
//}
//
//struct ImageView: View{
//    var index: Int
//    var width: CGFloat
//    var body: some View{
//        
//        VStack{
//            let imageName = index > 10 ? index - (10 * (index/10)) == 0 ? 10 :  index - (10 * (index/10)) :index
//            Image("post\(imageName)")
//                .resizable()
//                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                .frame(width: width, height: 120)
//                .cornerRadius(0)
//        }
//        
//    }
//    
//}
//
//struct TabBarButton: View{
//    var image: String
//    var isSystemImage: Bool
//    var animation: Namespace.ID
//    @Binding var selectedTab: String
//    
//    var body: some View {
//        
//        Button(action: {
//            withAnimation(.easeInOut){
//                selectedTab = image
//            }
//        }, label: {
//            VStack(spacing: 12){
//                (
//                    isSystemImage ? Image(systemName: image) : Image(image)
//                )
//                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 28, height: 28)
//                .foregroundColor(selectedTab == image ? .primary : .gray)
//                
//                ZStack{
//                    if selectedTab == image{
//                        Rectangle()
//                            .fill(Color.primary)
//                            .matchedGeometryEffect(id: "TAB", in: animation)
//                    }
//                    else {
//                        Rectangle()
//                            .fill(Color.clear)
//                    }
//                }
//                .frame(height: 1)
//            }
//        })
//        }
//        
//    }
//}
//
//#Preview {
//    ProfileView()
//}

//
//  ProfileView.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 17/06/24.
//

import SwiftUI

struct Post: Identifiable {
    let id: Int
    let username: String
    let caption: String
    let location: String
    let postImage: String
    let profileImage: String
    let initialLikes: Int
    let commentUser: String
    let commentText: String
}



struct ProfileView: View {
    // First Tab Image
    @State var selectedTab: String = "square.grid.3x3"
    
    // For Smooth Sliding Effect
    @Namespace var animation
    
    // Sample data for posts
        let posts: [Post] = [
            Post(id: 1, username: "beautyjasmine", caption: "Nice photoshoot🫶🏻", location: "Studio", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 811234, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips"),
            Post(id: 2, username: "beautyjasmine", caption: "Great experience🫶🏻", location: "Studio", postImage: "post2", profileImage: "beautyjasmine", initialLikes: 214321, commentUser: "ShadowLurker", commentText: "Are you always at the studio?"),
            Post(id: 3, username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post3", profileImage: "beautyjasmine", initialLikes: 246789, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL"),
            Post(id: 4, username: "beautyjasmine", caption: "Lovely day🫶🏻", location: "Cafe", postImage: "post4", profileImage: "beautyjasmine", initialLikes: 106789, commentUser: "ShadowLurker", commentText: "Your outfit looks ugly."),
            Post(id: 5, username: "beautyjasmine", caption: "Eiffel Tower🌸", location: "Paris", postImage: "post5", profileImage: "beautyjasmine", initialLikes: 398567, commentUser: "ShadowLurker", commentText: "I bet you don’t even like the view."),
            Post(id: 6, username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post6", profileImage: "beautyjasmine", initialLikes: 785634, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL")
            // Add more posts as needed
        ]
    
    var body: some View {
        NavigationView {
            VStack{
                HStack(){
                    Spacer()
                    Button(action: {}, label: {
                        Text("beautyjasmine")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .bold()
                        
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 18))
                    })
                    Spacer() // Menambahkan spacer untuk mendorong tombol "Settings" ke kanan
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }

                }
                .padding([.horizontal, .top], 10)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack{
                        Divider()
                        HStack{
                            Button(action: {}, label: {
                                Image("beautyjasmine")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            })
                            .padding(.trailing, 20)
                           
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
                            Button(action: {}, label: {
                                Text("Edit Profile")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.gray.opacity(0.3)
                                    )
                                    .cornerRadius(4) // Menambahkan corner radius pada latar belakang abu-abu
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray.opacity(0.3)) // Mengatur garis tepi abu-abu
                                    )
                                      
                            })
                            
                            Button(action: {}, label: {
                                Text("Promotions")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.gray.opacity(0.3)
                                    )
                                    .cornerRadius(4) // Menambahkan corner radius pada latar belakang abu-abu
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray.opacity(0.3)) // Mengatur garis tepi abu-abu
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
                                                            ForEach(posts) { post in
                                                                // for getting width for image
                                                                GeometryReader { proxy in
                                                                    let width = proxy.frame(in: .global).width
                                                                    
                                                                    NavigationLink(destination: PostView(
                                                                        username: post.username,
                                                                        caption: post.caption,
                                                                        location: post.location,
                                                                        postImage: post.postImage,
                                                                        profileImage: post.profileImage,
                                                                        initialLikes: post.initialLikes,
                                                                        commentUser: post.commentUser,
                                                                        commentText: post.commentText
                                                                    )) {
                                                                        Image(post.postImage)
                                                                            .resizable()
                                                                            .aspectRatio(contentMode: .fill)
                                                                            .frame(width: width, height: 120)
                                                                            .cornerRadius(0)
                                                                    }
                                                                }
                                                                .frame(height: 120)
                                                            }
                                                        })
//                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2, content: {
//                                ForEach(1...20, id: \.self){ index in
//                                    // for getting width for image
//                                    GeometryReader { proxy in
//                                        let width = proxy.frame(in: .global).width
//                                        let imageName = index > 10 ? index - (10 * (index/10)) == 0 ? 10 : index - (10 * (index/10)) : index
//                                        
//                                        NavigationLink(destination: PostView(
//                                            username: "beautyjasmine",
//                                            caption: "My niece is so cute",
//                                            location: "Location",
//                                            postImage: "post\(imageName)",
//                                            profileImage: "beautyjasmine",
//                                            initialLikes: 11926,
//                                            commentUser: "ShadowLurker",
//                                            commentText: "That lips look like pongo lips"
//                                        )) {
//                                            Image("post\(imageName)")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: width, height: 120)
//                                                .cornerRadius(0)
//                                        }
//                                    }
//                                    .frame(height: 120)
//                                }
//                            })
                        }
                    }
                })
            }
        }
    }
}


#Preview {
    ProfileView()
}
