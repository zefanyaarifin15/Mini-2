import SwiftUI

struct PostDetailView2: View {
    var index: Int
    
    var body: some View {
        VStack {
            let imageName = index > 10 ? index - (10 * (index / 10)) == 0 ? 10 : index - (10 * (index / 10)) : index
            Image("post\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationTitle("Post \(index)")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
