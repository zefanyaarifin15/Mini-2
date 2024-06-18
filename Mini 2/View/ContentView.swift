import SwiftUI

struct ContentView: View {
 
    @State private var likes = 10526
    @State private var hasLiked = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("beautyjasmine")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("beautyjasmine")
                        .font(.headline)
                    Text("Location")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)


            Image("Postingan 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .clipped()

 
            HStack {
                Button(action: {
        
                    hasLiked.toggle()
                    likes += hasLiked ? 1 : -1
                }) {
                    HStack {
                        Image(systemName: hasLiked ? "heart.fill" : "heart")
                            .foregroundColor(hasLiked ? .red : .primary)
                        Text("\(likes)")
                            .foregroundColor(.primary)
                    }
                }
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "message")
                            .foregroundColor(.primary)
                        Text("8")
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            
            VStack(alignment: .leading) {
                Text("Liked by shadowlurker and \(likes) others")
                    .font(.subheadline)
                HStack {
                    Text("Username")
                        .font(.headline)
                    + Text(" Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet! Lorem Ipsum dolor sit amet!")
                        .font(.subheadline)
                    + Text(" #Proud")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
                
                Text("View all comments")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            

                HStack {
                    Text("shadowlurker")
                        .font(.headline)
                    + Text(" Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet! Lorem Ipsum dolor sit amet")
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
