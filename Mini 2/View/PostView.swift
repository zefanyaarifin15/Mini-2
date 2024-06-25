//
//  PostView.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 24/06/24.
//

//
//import SwiftUI
//
//
//struct PostView: View {
//    let username: String
//    let caption: String
//    let location: String
//    let postImage: String
//    let profileImage: String
//    let initialLikes: Int
//    let commentUser: String
//    let commentText: String
//    
//    @State private var isLiked = false
//    @State private var likesCount: Int
//    
//    init(username: String, caption: String, location: String, postImage: String, profileImage: String, initialLikes: Int, commentUser: String, commentText: String) {
//        self.username = username
//        self.caption = caption
//        self.location = location
//        self.postImage = postImage
//        self.profileImage = profileImage
//        self.initialLikes = initialLikes
//        self.commentUser = commentUser
//        self.commentText = commentText
//        _likesCount = State(initialValue: initialLikes)
//    }
//    
//    var body: some View {
//        VStack {
//            HStack(alignment: .top) {
//                Image(profileImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
//                    .cornerRadius(100)
//                
//                VStack(alignment: .leading) {
//                    Text(username)
//                        .font(.system(size: 18))
//                        .foregroundColor(.black)
//                        .bold()
//                    
//                    Text(location)
//                        .font(.system(size: 15))
//                        .foregroundColor(.gray)
//                }
//                .padding(.top, 3)
//                
//                Spacer()
//                
//                Button {
//                    
//                } label: {
//                    Image("dots")
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .padding(.trailing, 15)
//                        .padding(.top, 5)
//                }
//            }
//            .padding(.leading, 15)
//            .padding(.bottom, 5)
//            
//            ZStack(alignment: .topLeading){
//                Image(postImage)
//                    .resizable()
//                    .scaledToFill()
//                    .cornerRadius(20)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .padding(.trailing, 15)
//                    .padding(.leading, 15)
//            }
//            
//            VStack(alignment: .leading, spacing: 3) {
//                HStack(spacing: 20) {
//                    Button {
//                        isLiked.toggle()
//                        likesCount += isLiked ? 1 : -1
//                    } label: {
//                        Image(systemName: isLiked ? "heart.fill" : "heart")
//                            .resizable()
//                            .foregroundColor(isLiked ? .red : .black)
//                            .frame(width: 25, height: 25)
//                    }
//                    
//                    Button {
//                        print("comment button tapped")
//                    } label: {
//                        Image(systemName: "ellipsis.bubble")
//                            .resizable()
//                            .foregroundColor(.black)
//                            .frame(width: 25, height: 25)
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 18)
//                
//                Text("\(likesCount) others")
//                    .font(.system(size: 16))
//                    .bold()
//                    .padding(.leading, 18)
//                    .padding(.top, 10)
//                
//                HStack {
//                    Text(username)
//                        .font(.system(size: 16))
//                        .bold()
//                        .padding(.leading, 18)
//                        .padding(.top, 5)
//                    
//                    Text(caption)
//                        .font(.system(size: 16))
//                        .padding(.top, 5)
//                }
//                
//                Button {
//                    
//                } label: {
//                    Text("View all comments")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 16))
//                        .padding(.leading, 18)
//                }
//                .padding(.top, 3)
//                
//                NavigationLink(destination: StalkerView()) {
//                    HStack {
//                        Text(commentUser)
//                            .foregroundColor(.black)
//                            .font(.system(size: 16))
//                            .bold()
//                            .padding(.leading, 18)
//                        
//                        Text(commentText)
//                            .font(.system(size: 16))
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(username: "beautyjasmine", caption: "My niece is so cute", location: "Home", postImage: "feeds1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips")
//    }
//}

import SwiftUI

struct PostView: View {
    let username: String
    let caption: String
    let location: String
    let postImage: String
    let profileImage: String
    let initialLikes: Int
    let commentUser: String
    let commentText: String
    
    @State private var isLiked = false
    @State private var likesCount: Int
    
    init(username: String, caption: String, location: String, postImage: String, profileImage: String, initialLikes: Int, commentUser: String, commentText: String) {
        self.username = username
        self.caption = caption
        self.location = location
        self.postImage = postImage
        self.profileImage = profileImage
        self.initialLikes = initialLikes
        self.commentUser = commentUser
        self.commentText = commentText
        _likesCount = State(initialValue: initialLikes)
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
                    .cornerRadius(100)
                
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .bold()
                    
                    Text(location)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(.top, 3)
                
                Spacer()
                
                Button {
                    
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
                Image(postImage)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.trailing, 15)
                    .padding(.leading, 15)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 20) {
                    Button {
                        isLiked.toggle()
                        likesCount += isLiked ? 1 : -1
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .resizable()
                            .foregroundColor(isLiked ? .red : .black)
                            .frame(width: 25, height: 25)
                    }
                    
                    Button {
                        print("comment button tapped")
                    } label: {
                        Image(systemName: "ellipsis.bubble")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 18)
                
                Text("\(likesCount) others")
                    .font(.system(size: 16))
                    .bold()
                    .padding(.leading, 18)
                    .padding(.top, 10)
                
                HStack {
                    Text(username)
                        .font(.system(size: 16))
                        .bold()
                        .padding(.leading, 18)
                        .padding(.top, 5)
                    
                    Text(caption)
                        .font(.system(size: 16))
                        .padding(.top, 5)
                }
                
                NavigationLink(destination: CommentsView()) {
                    Text("View all comments")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.leading, 18)
                }
                .padding(.top, 3)
                
                NavigationLink(destination: StalkerView()) {
                    HStack {
                        Text(commentUser)
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .bold()
                            .padding(.leading, 18)
                        
                        Text(commentText)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(username: "beautyjasmine", caption: "My niece is so cute", location: "Home", postImage: "feeds1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "You're nothing but a fake")
    }
}
