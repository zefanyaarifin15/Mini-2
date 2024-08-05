//
//import SwiftUI
//
//struct StalkerView: View {
//    @State var selectedTab: String = "square.grid.3x3.fill"
//    @Namespace var animation
//    @State private var isFollowed = false
//    @State private var followersCount = 0
//    @State private var isBlocked = false
//    @State private var showBlockView = false
//
//    let postImages = ["StalkerPost1", "StalkerPost2", "StalkerPost3"]
//    let captions = ["you think you're cool?!", "In the shadows", "You can't see me"]
//
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Button(action: {}, label: {
//                    Text("shadowlurker")
//                        .font(.system(size: 18))
//                        .foregroundColor(.black)
//                        .bold()
//                })
//                Spacer()
//                Button(action: {
//                    showBlockView.toggle()
//                }) {
//                    Image(systemName: "ellipsis")
//                        .foregroundColor(.black)
//                        .font(.system(size: 18))
//                        .padding(.trailing, 5)
//                }
//                .sheet(isPresented: $showBlockView) {
//                    BlockUserView(isBlocked: $isBlocked)
//                }
//            }
//            .padding([.horizontal, .top], 10)
//            
//            if isBlocked {
//                VStack {
//                    Text("You have blocked this user.")
//                        .font(.headline)
//                        .padding()
//                    Image(systemName: "hand.raised.fill")
//                        .font(.system(size: 64))
//                        .foregroundColor(.red)
//                        .padding()
//                }
//            } else {
//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack {
//                        Divider()
//                        HStack {
//                            Button(action: {}, label: {
//                                Image("Stalker")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 100, height: 100)
//                                    .clipShape(Circle())
//                            })
//                            .padding(.trailing, 20)
//                            
//                            VStack(alignment:.leading, spacing: 4) {
//                                Text("shadowlurker")
//                                    .bold()
//                                    .foregroundColor(.black)
//                                Text("Hiding in plain sight Lol")
//                                    .foregroundColor(.gray)
//                                Text("")
//                                Text("Lihat terjemahan")
//                            }
//                        }
//                        .padding([.horizontal, .top])
//                        .padding(.bottom, 15)
//                        
//                        HStack {
//                            VStack {
//                                Text("\(postImages.count)")
//                                    .font(.system(size: 22))
//                                    .bold()
//                                    .foregroundColor(.black)
//                                
//                                Text("Posts")
//                            }
//                            .frame(maxWidth: .infinity)
//                            
//                            VStack {
//                                Text("\(followersCount)")
//                                    .font(.system(size: 22))
//                                    .bold()
//                                    .foregroundColor(.black)
//                                
//                                Text("Followers")
//                            }
//                            .frame(maxWidth: .infinity)
//                            
//                            VStack {
//                                Text("1")
//                                    .font(.system(size: 22))
//                                    .bold()
//                                    .foregroundColor(.black)
//                                
//                                Text("Following")
//                            }
//                            .frame(maxWidth: .infinity)
//                        }
//                        .padding([.horizontal, .top], 5)
//                        
//                        HStack {
//                            Button(action: {
//                                isFollowed.toggle()
//                                followersCount += isFollowed ? 1 : -1
//                            }, label: {
//                                Text(isFollowed ? "Following" : "Follow Back")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(isFollowed ? .black : .white)
//                                    .padding(.vertical, 10)
//                                    .frame(maxWidth: .infinity)
//                                    .background(isFollowed ? Color.gray.opacity(0.3) : Color.blue.opacity(0.8))
//                                    .cornerRadius(4)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.gray.opacity(0.3))
//                                    )
//                            })
//                            
//                            Button(action: {}, label: {
//                                Text("Message")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.primary)
//                                    .padding(.vertical, 10)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color.gray.opacity(0.3))
//                                    .cornerRadius(4)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.gray.opacity(0.3))
//                                    )
//                            })
//                        }
//                        .padding()
//                        
//                        HStack(spacing: 0) {
//                            TabBarButton(image: "square.grid.3x3.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
//                            
//                            TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
//                        }
//                        .frame(height: 40, alignment: .bottom)
//                        
//                        ZStack {
//                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
//                                ForEach(0..<postImages.count, id: \.self) { index in
//                                    let imageName = postImages[index]
//                                    let caption = captions[index]
//
//                                    GeometryReader { proxy in
//                                        let width = proxy.frame(in: .global).width
//                                        NavigationLink(destination: PostDetailView(imageName: imageName, username: "shadowlurker", caption: caption, profileImage: "Stalker", initialLikes: 0)) {
//                                            ImageView(imageName: imageName, width: width)
//                                        }
//                                    }
//                                    .frame(height: 120)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//struct BlockUserView: View {
//    @Binding var isBlocked: Bool
//
//    var body: some View {
//        VStack {
//            Text("Are you sure you want to block shadowlurker?")
//                .font(.headline)
//                .padding()
//
//            Button(action: {
//                isBlocked = true
//            }) {
//                Text("Block User")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.red)
//                    .cornerRadius(8)
//            }
//            .padding()
//
//            Button(action: {
//                isBlocked = false
//            }) {
//                Text("Cancel")
//                    .foregroundColor(.blue)
//                    .padding()
//            }
//        }
//    }
//}
//
//
//struct ImageView: View {
//    var imageName: String
//    var width: CGFloat
//
//    var body: some View {
//        VStack {
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: width, height: 120)
//                .cornerRadius(0)
//        }
//    }
//}
//
//#Preview {
//    StalkerView()
//}

import SwiftUI

struct StalkerView: View {
    @State var selectedTab: String = "square.grid.3x3.fill"
    @Namespace var animation
    @State private var isFollowed = false
    @State private var followersCount = 0
    @State private var isBlocked = false
    @State private var showBlockView = false

    let postImages = ["StalkerPost1", "StalkerPost2", "StalkerPost3"]
    let captions = ["you think you're cool?!", "In the shadows", "You can't see me"]

    var body: some View {
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
                Button(action: {
                    showBlockView.toggle()
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .padding(.trailing, 5)
                }
                .sheet(isPresented: $showBlockView) {
                    BlockUserView(isBlocked: $isBlocked, showBlockView: $showBlockView)
                }
            }
            .padding([.horizontal, .top], 10)
            
            if isBlocked {
                VStack {
                    Text("You have blocked this user.")
                        .font(.headline)
                        .padding()
                    Image(systemName: "hand.raised.fill")
                        .font(.system(size: 64))
                        .foregroundColor(.red)
                        .padding()
                }
            } else {
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
                                Text("\(followersCount)")
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
                            Button(action: {
                                isFollowed.toggle()
                                followersCount += isFollowed ? 1 : -1
                            }, label: {
                                Text(isFollowed ? "Following" : "Follow Back")
                                    .fontWeight(.semibold)
                                    .foregroundColor(isFollowed ? .black : .white)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(isFollowed ? Color.gray.opacity(0.3) : Color.blue.opacity(0.8))
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
                        .padding()
                        
                        HStack(spacing: 0) {
                            TabBarButton(image: "square.grid.3x3.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                            
                            TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                        }
                        .frame(height: 40, alignment: .bottom)
                        
                        ZStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
                                ForEach(0..<postImages.count, id: \.self) { index in
                                    let imageName = postImages[index]
                                    let caption = captions[index]

                                    GeometryReader { proxy in
                                        let width = proxy.frame(in: .global).width
                                        NavigationLink(destination: PostDetailView(imageName: imageName, username: "shadowlurker", caption: caption, profileImage: "Stalker", initialLikes: 0)) {
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

struct BlockUserView: View {
    @Binding var isBlocked: Bool
    @Binding var showBlockView: Bool

    var body: some View {
        VStack {
            Text("Are you sure you want to block shadowlurker?")
                .font(.headline)
                .padding()

            Button(action: {
                isBlocked = true
                showBlockView = false
            }) {
                Text("Block User")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding()

            Button(action: {
                showBlockView = false
            }) {
                Text("Cancel")
                    .foregroundColor(.blue)
                    .padding()
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

#Preview {
    StalkerView()
}
