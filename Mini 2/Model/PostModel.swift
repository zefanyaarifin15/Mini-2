//
//  PostModel.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 23/06/24.
//

import Foundation

//struct Post: Identifiable {
//    let id: Int
//    let username: String
//    let caption: String
//    let location: String
//    let postImage: String
//    let profileImage: String
//    let initialLikes: Int
//    let commentUser: String
//    let commentText: String
//}


struct Post: Identifiable {
    let id = UUID()
    let username: String
    let caption: String
    let location: String
    let postImage: String
    let profileImage: String
    let initialLikes: Int
    let commentUser: String
    let commentText: String
}
