import SwiftUI

struct TabBarButton: View {
    var image: String
    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = image
            }
        }) {
            VStack {
                if isSystemImage {
                    Image(systemName: image)
                        .font(.system(size: 24))
                } else {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                
                if selectedTab == image {
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 30, height: 2)
                        .matchedGeometryEffect(id: "tab", in: animation)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 30, height: 2)
                }
            }
            .foregroundColor(selectedTab == image ? .black : .gray)
        }
    }
}
