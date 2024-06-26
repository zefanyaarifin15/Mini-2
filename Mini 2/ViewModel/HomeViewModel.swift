//
//  HomeViewModel.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 24/06/24.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = [
        Post(username: "beautyjasmine", caption: "beauty Mascara🫶🏻", location: "Home", postImage: "post1", profileImage: "beautyjasmine", initialLikes: 319872, commentUser: "ShadowLurker", commentText: "That lips look like pongo lips"),
        Post(username: "nataliebert", caption: "candid 🫶🏻", location: "Studio", postImage: "post4", profileImage: "Natalie", initialLikes: 12898, commentUser: "beautyjasmine", commentText: "So stunning😍"),
        Post(username: "stephaniejenn", caption: "great holiday", location: "Paris", postImage: "paris", profileImage: "Stephanie", initialLikes: 51530, commentUser: "beautyjasmine", commentText: "My pretty bestie😍"),
        Post(username: "rosemisela", caption: "Candid looks", location: "Lucy Cafe", postImage: "Rose", profileImage: "Rose", initialLikes: 9240, commentUser: "beautyjasmine", commentText: "😍🫶🏻")
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
