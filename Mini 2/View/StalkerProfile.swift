import SwiftUI

struct StalkerView: View {
    
    @State var selectedTab: String = "square.grid.3x3"
    
    @Namespace var animation

    let postImages = ["StalkerPost1", "StalkerPost2", "StalkerPost3"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("shadowlurker")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .bold()
                    })
                    Spacer()
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
                .padding([.horizontal, .top], 10)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Divider()
                        HStack {
                            Button(action: {}, label: {
                                Image("Stalker")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            })
                            .padding(.trailing, 20)
                            
                            VStack(alignment:.leading, spacing: 4) {
                                Text("shadowlurker")
                                    .bold()
                                    .foregroundColor(.black)
                                Text("Hiding in plain sight Lol")
                                    .foregroundColor(.gray)
                                Text("")
                                Text("Lihat terjemahan")
                            }
                        }
                        .padding([.horizontal, .top])
                        .padding(.bottom, 15)
                        
                        HStack {
                            VStack {
                                Text("\(postImages.count)")
                                    .font(.system(size: 22))
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Text("Posts")
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("0")
                                    .font(.system(size: 22))
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Text("Followers")
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("1")
                                    .font(.system(size: 22))
                                    .bold()
                                    .foregroundColor(.black)
                                
                                Text("Following")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding([.horizontal, .top], 5)
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("Follow Back")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray.opacity(0.3))
                                    )
                            })
                            
                            Button(action: {}, label: {
                                Text("Message")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.gray.opacity(0.3))
                                    )
                            })
                        }
                        .padding([.horizontal, .top])
                        
                        HStack(spacing: 0) {
                            TabBarButton(image: "square.grid.3x3.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                            
                            TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                        }
                        .frame(height: 40, alignment: .bottom)
                        
                        // tab view
                        ZStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
                                ForEach(postImages, id: \.self) { imageName in
                                    GeometryReader { proxy in
                                        let width = proxy.frame(in: .global).width
                                        NavigationLink(destination: PostDetailView(imageName: imageName)) {
                                            ImageView(imageName: imageName, width: width)
                                        }
                                    }
                                    .frame(height: 120)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    var imageName: String
    var width: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: 120)
                .cornerRadius(0)
        }
    }
}

struct TabBarButton: View {
    var image: String
    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 12) {
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                )
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
        })
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
        .padding(.bottom, 5)
        .background(Color.clear)
        .foregroundColor(selectedTab == image ? .black : .gray)
    }
}

struct PostDetailView: View {
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationTitle(imageName)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    StalkerView()
}
