//
//  FeedsViewModel.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 23/06/24.
//

import Foundation
import SwiftUI
//
//var posts: [Post] = [
//    Post(id: 1, username: "beautyjasmine", caption: "Nice photoshoot🫶🏻", location: "Studio", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 811234, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips"),
//    Post(id: 2, username: "beautyjasmine", caption: "Great experience🫶🏻", location: "Studio", postImage: "post2", profileImage: "beautyjasmine", initialLikes: 214321, commentUser: "ShadowLurker", commentText: "Are you always at the studio?"),
//    Post(id: 3, username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post3", profileImage: "beautyjasmine", initialLikes: 246789, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL"),
//    Post(id: 4, username: "beautyjasmine", caption: "Lovely day🫶🏻", location: "Cafe", postImage: "post4", profileImage: "beautyjasmine", initialLikes: 106789, commentUser: "ShadowLurker", commentText: "Your outfit looks ugly."),
//    Post(id: 5, username: "beautyjasmine", caption: "Eiffel Tower🌸", location: "Paris", postImage: "post5", profileImage: "beautyjasmine", initialLikes: 398567, commentUser: "ShadowLurker", commentText: "I bet you don’t even like the view."),
//    Post(id: 6, username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post6", profileImage: "beautyjasmine", initialLikes: 785634, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL")
//    // Add more posts as needed
//]


class FeedsViewModel: ObservableObject {
    @Published var posts: [Post] = [
        Post(username: "beautyjasmine", caption: "Nice photoshoot🫶🏻", location: "Studio", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 811234, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips"),
        Post(username: "beautyjasmine", caption: "Great experience🫶🏻", location: "Studio", postImage: "post2", profileImage: "beautyjasmine", initialLikes: 214321, commentUser: "ShadowLurker", commentText: "Are you always at the studio?"),
        Post(username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post3", profileImage: "beautyjasmine", initialLikes: 246789, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL"),
        Post(username: "beautyjasmine", caption: "Lovely day🫶🏻", location: "Cafe", postImage: "post4", profileImage: "beautyjasmine", initialLikes: 106789, commentUser: "ShadowLurker", commentText: "Your outfit looks ugly."),
        Post(username: "beautyjasmine", caption: "Eiffel Tower🌸", location: "Paris", postImage: "post5", profileImage: "beautyjasmine", initialLikes: 398567, commentUser: "ShadowLurker", commentText: "I bet you don’t even like the view."),
        Post(username: "beautyjasmine", caption: "Favorite pose🫶🏻", location: "Cafe", postImage: "post6", profileImage: "beautyjasmine", initialLikes: 785634, commentUser: "ShadowLurker", commentText: "That pose again? not creative LOL")
        // Add more posts as needed
    ]
    
    func addPost(username: String, caption: String, location: String, postImage: String, profileImage: String, initialLikes: Int, commentUser: String, commentText: String) {
        let newPost = Post(
            username: username,
            caption: caption,
            location: location,
            postImage: postImage,
            profileImage: profileImage,
            initialLikes: initialLikes,
            commentUser: commentUser,
            commentText: commentText
        )
        posts.append(newPost)
    }
}

