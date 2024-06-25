//
//  CommentModel.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 25/06/24.
//

import Foundation


struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let text: String
}
