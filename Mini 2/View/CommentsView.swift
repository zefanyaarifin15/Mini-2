
//  CommentsView.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 25/06/24.


//import SwiftUI
//
//struct CommentsView: View {
//    @EnvironmentObject private var progress: UserProgress
//    @Binding var commentUser: String
//    @Binding var commentText: String
//    
//    var comments: [Comment] {
//        var tempComments = [
//            Comment(username: "makeupfanatic", text: "Love this look! Can you share your routine?"),
//            Comment(username: "beautyjunkie", text: "Your makeup is always on point!"),
//            Comment(username: "ShadowLurker", text: "You're nothing but a fake"),
//            Comment(username: "beautylover", text: "Absolutely stunning!"),
//            Comment(username: "glamqueen", text: "You look gorgeous! What's your lipstick shade?"),
//            Comment(username: "nataliebert", text: "So stunning😍"),
//            Comment(username: "stephaniejenn", text: "Love this look on you!❤️"),
//            Comment(username: "rosemisela", text: "Absolutely beautiful!"),
//            Comment(username: "makeupaddict", text: "I need this look in my life!"),
//            Comment(username: "beautybabe", text: "Your makeup is flawless!"),
//            Comment(username: "cosmeticqueen", text: "You're glowing!"),
//            Comment(username: "makeuplover", text: "Stunning as always!😍"),
//            Comment(username: "makeupenthusiast", text: "Can't get over how amazing you look!"),
//            Comment(username: "beautyobsessed", text: "You're my makeup inspiration!"),
//            Comment(username: "glamourfan", text: "Such a beautiful look!"),
//            Comment(username: "makeupgeek", text: "Love this so much!"),
//            Comment(username: "beautyaddicted", text: "Your makeup skills are incredible!"),
//            Comment(username: "cosmeticfanatic", text: "You always look amazing!"),
//            Comment(username: "glamsquad", text: "Love this! You're so talented!"),
//            Comment(username: "beautyicon", text: "Absolutely gorgeous!")
//        ]
//        
//        if let index = tempComments.firstIndex(where: { $0.username == "ShadowLurker" }) {
//            tempComments[index] = Comment(username: commentUser, text: commentText)
//        }
//        
//        return tempComments
//    }
//    
//    var body: some View {
//        List(comments) { comment in
//            HStack {
//                Text(comment.username)
//                    .font(.system(size: 16))
//                    .bold()
//                
//                Text(comment.text)
//                    .font(.system(size: 16))
//            }
//            .padding(.vertical, 5)
//        }
//        .navigationTitle("Comments")
//        .onAppear {
//            progress.incrementCounter()
//            print("task 1")
//        }
//    }
//}
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(commentUser: .constant("ShadowLurker"), commentText: .constant("That lips look like pongo lips"))
//            .environmentObject(UserProgress())
//    }
//}
//

import SwiftUI
struct CommentsView: View {
    @EnvironmentObject private var progress: UserProgress
    @Binding var commentUser: String
    @Binding var commentText: String
    
    var comments: [Comment] {
        var tempComments = [
            Comment(username: "makeupfanatic", text: "Love this look! Can you share your routine?"),
            Comment(username: "beautyjunkie", text: "Your makeup is always on point!"),
            Comment(username: "ShadowLurker", text: "You're nothing but a fake"),
            Comment(username: "beautylover", text: "Absolutely stunning!"),
            Comment(username: "glamqueen", text: "You look gorgeous! What's your lipstick shade?"),
            Comment(username: "nataliebert", text: "So stunning😍"),
            Comment(username: "stephaniejenn", text: "Love this look on you!❤️"),
            Comment(username: "rosemisela", text: "Absolutely beautiful!"),
            Comment(username: "makeupaddict", text: "I need this look in my life!"),
            Comment(username: "beautybabe", text: "Your makeup is flawless!"),
            Comment(username: "cosmeticqueen", text: "You're glowing!"),
            Comment(username: "makeuplover", text: "Stunning as always!😍"),
            Comment(username: "makeupenthusiast", text: "Can't get over how amazing you look!"),
            Comment(username: "beautyobsessed", text: "You're my makeup inspiration!"),
            Comment(username: "glamourfan", text: "Such a beautiful look!"),
            Comment(username: "makeupgeek", text: "Love this so much!"),
            Comment(username: "beautyaddicted", text: "Your makeup skills are incredible!"),
            Comment(username: "cosmeticfanatic", text: "You always look amazing!"),
            Comment(username: "glamsquad", text: "Love this! You're so talented!"),
            Comment(username: "beautyicon", text: "Absolutely gorgeous!")
        ]
        
        tempComments.insert(Comment(username: commentUser, text: commentText), at: 0)
        
        return tempComments
    }
    
    var body: some View {
        List(comments) { comment in
            HStack {
                Text(comment.username)
                    .font(.system(size: 16))
                    .bold()
                
                Text(comment.text)
                    .font(.system(size: 16))
            }
            .padding(.vertical, 5)
        }
        .navigationTitle("Comments")
        .onAppear {
            progress.incrementCounter()
            print("task 1")
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(commentUser: .constant("ShadowLurker"), commentText: .constant("That lips look like pongo lips"))
            .environmentObject(UserProgress())
    }
}

