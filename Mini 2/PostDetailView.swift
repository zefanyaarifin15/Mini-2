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
                Image(systemName: "ellipsis")
                    .padding()
            }
            .padding(.horizontal)

            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

            HStack {
                Button(action: {
                    isLiked.toggle()
                    likesCount += isLiked ? 1 : -1
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .black)
                }
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")

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
