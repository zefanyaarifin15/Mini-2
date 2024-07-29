//
//  PostDetailView.swift
//  Mini 2
//
//  Created by Jasmine Mutia Alifa on 24/06/24.
//

import SwiftUI

struct PostDetailView: View {
    var imageName: String
    var username: String
    var caption: String
    var profileImage: String
    var initialLikes: Int

    @State private var isLiked = false
    @State private var likesCount: Int

    init(imageName: String, username: String, caption: String, profileImage: String, initialLikes: Int) {
        self.imageName = imageName
        self.username = username
        self.caption = caption
        self.profileImage = profileImage
        self.initialLikes = initialLikes
        _likesCount = State(initialValue: initialLikes)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(profileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(username)
                    .font(.headline)
                Spacer()
                Image("dots")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 15)
                    .padding(.top, 5)
            }
            .padding(.horizontal)

            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

            HStack(spacing: 20) {
                Button(action: {
                    isLiked.toggle()
                    likesCount += isLiked ? 1 : -1
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(isLiked ? .red : .black)
                        .frame(width: 25, height: 25)
                }
                Image(systemName: "ellipsis.bubble")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
                //Image(systemName: "paperplane")

                Spacer()
            }
            .padding(.horizontal)

            Text("\(likesCount) likes")
                .font(.subheadline)
                .padding(.horizontal)

            HStack {
                Text(username)
                    .font(.headline)
                Text(caption)
                    .font(.body)
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationBarTitle("Post", displayMode: .inline)
    }
}

#Preview {
    PostDetailView(imageName: "post1", username: "beautyjasmine", caption: "beauty Mascara🫶🏻", profileImage: "beautyjasmine", initialLikes: 319872)
}
