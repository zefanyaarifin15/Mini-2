
//import SwiftUI
//
//struct PostView: View {
//    let username: String
//    let caption: String
//    let location: String
//    let postImage: String
//    let profileImage: String
//    let initialLikes: Int
//    
//    @State private var isLiked = false
//    @State private var likesCount: Int
//    @State private var commentUser: String
//    @State private var commentText: String
//    
//    init(username: String, caption: String, location: String, postImage: String, profileImage: String, initialLikes: Int, commentUser: String, commentText: String) {
//        self.username = username
//        self.caption = caption
//        self.location = location
//        self.postImage = postImage
//        self.profileImage = profileImage
//        self.initialLikes = initialLikes
//        _likesCount = State(initialValue: initialLikes)
//        _commentUser = State(initialValue: commentUser)
//        _commentText = State(initialValue: commentText)
//    }
//    
//    var topComment: Comment {
//        Comment(username: commentUser, text: commentText)
//    }
//    
//    var body: some View {
//        VStack {
//            HStack(alignment: .top) {
//                Image(profileImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 50, height: 50)
//                    .cornerRadius(25)
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
//                    // action for button
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
//            ZStack(alignment: .topLeading) {
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
//                NavigationLink(destination: CommentsView(commentUser: $commentUser, commentText: $commentText)) {
//                    Text("View all comments")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 16))
//                        .padding(.leading, 18)
//                }
//                .padding(.top, 3)
//                
//                HStack {
//                    Text(topComment.username)
//                        .foregroundColor(.black)
//                        .font(.system(size: 16))
//                        .bold()
//                        .padding(.leading, 18)
//                    
//                    Text(topComment.text)
//                        .font(.system(size: 16))
//                        .foregroundColor(.black)
//                }
//            }
//        }
//    }
//}
//
//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(username: "beautyjasmine", caption: "beauty Mascara🫶🏻", location: "Home", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips")
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
    
    @State private var isLiked = false
    @State private var likesCount: Int
    @State private var commentUser: String
    @State private var commentText: String
    
    init(username: String, caption: String, location: String, postImage: String, profileImage: String, initialLikes: Int, commentUser: String, commentText: String) {
        self.username = username
        self.caption = caption
        self.location = location
        self.postImage = postImage
        self.profileImage = profileImage
        self.initialLikes = initialLikes
        _likesCount = State(initialValue: initialLikes)
        _commentUser = State(initialValue: commentUser)
        _commentText = State(initialValue: commentText)
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
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
                    // action for button
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
            
            ZStack(alignment: .topLeading) {
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
                
                NavigationLink(destination: CommentsView(commentUser: $commentUser, commentText: $commentText)) {
                    Text("View all comments")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.leading, 18)
                }
                .padding(.top, 3)
                
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(username: "beautyjasmine", caption: "beauty Mascara🫶🏻", location: "Home", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips")
    }
}

/*
 Post + Comments:
 - Samain comment ShadowLurkernya (PostView & CommentsView)
 - [line 125-137] Bikin comment yang muncul itu comment yang paling atas yang ada di CommentsView(), 
   jadi ga selalu comment dari ShadowLurker
 */
