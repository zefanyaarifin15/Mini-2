//
//  ProfileView 2.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 22/06/24.
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


struct ProfileView1: View {
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
                                .padding(.trailing, 80
                                )
                            
                            TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                                .padding(.leading, 80
                                )
                        }
                        .frame(height: 70, alignment: .bottom)
                        
                        // tab view
                        ZStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
                                ForEach(posts) { post in
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
                            }
//                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2, content: {
//                            ForEach(posts) { post in
//                                    GeometryReader { proxy in
//                                        let width = proxy.frame(in: .global).width
//                            NavigationLink(destination: PostView(
//                                                username: post.username,
//                                                caption: post.caption,
//                                                location: post.location,
//                                                postImage: post.postImage,
//                                                profileImage: post.profileImage,
//                                                initialLikes: post.initialLikes,
//                                                commentUser: post.commentUser,
//                                                commentText: post.commentText
//                                        )) {
//                                            Image(post.postImage)
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: width, height: 120)
//                                                .cornerRadius(0)
//                                            }
//                                        }
//                                        .frame(height: 120)
//                                    }
//                                })
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    ProfileView1()
}
