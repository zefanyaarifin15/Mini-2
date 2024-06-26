import SwiftUI

struct DraggableView<Content>: View where Content: View {
    @State private var position: CGSize = .zero
    var content: () -> Content
    
    var body: some View {
        content()
            .offset(x: position.width, y: position.height)
            .gesture(DragGesture()
                        .onChanged { value in
                            self.position = value.translation
                        }
            )
    }
}

struct RBView: View {
    @State private var connections: Set<Connection> = []
    @State private var photos: [Photo] = [
        Photo(name: "Rose", image: Image("Rose"), position: CGPoint(x: 70, y: 200)),
        Photo(name: "Stephanie", image: Image("Stephanie"), position: CGPoint(x: 70, y: 500)),
        Photo(name: "James", image: Image("James"), position: CGPoint(x: 322, y: 200)),
        Photo(name: "Natalie", image: Image("Natalie"), position: CGPoint(x: 322, y: 500)),
        Photo(name: "Jasmine", image: Image("beautyjasmine"), position: CGPoint(x: 196, y: 350))
    ]
    @State private var notes: [Note] = [
        Note(text: "Note 1", position: CGPoint(x: 320, y: 680)),
        Note(text: "Note 2", position: CGPoint(x: 180, y: 680))
    ]
    @State private var connectingPhoto: Photo?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .overlay(
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.3)
                    )
                    .edgesIgnoringSafeArea(.all)
                
                ForEach(photos.indices, id: \.self) { index in
                    DraggableView {
                        VStack {
                            NavigationLink(destination: ReportView(photo: photos[index])) {
                                photos[index].image
                                    .resizable()
                                    .frame(width: 100, height: 110)
                                    .clipShape(RoundedRectangle(cornerRadius: 0))
                                    .shadow(radius: 0)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(photos[index].name)
                                .frame(maxWidth: 100)
                                .padding(.vertical, 7)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .onTapGesture {
                                    if let connectingPhoto = connectingPhoto {
                                        connections.insert(Connection(start: connectingPhoto.position, end: photos[index].position))
                                        self.connectingPhoto = nil
                                    } else {
                                        connectingPhoto = photos[index]
                                    }
                                }
                        }
                        .background(Color.white)
                        .border(Color.gray, width: 1)
                        .shadow(radius: 0.5)
                        .padding(8)
                        .position(photos[index].position)
                    }
                }
                
                ForEach(notes.indices, id: \.self) { index in
                    DraggableView {
                        VStack {
                            TextField( "Note 1", text: $notes[index].text)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 120, height: 120)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        .position(notes[index].position)
                    }
                }
                
                ForEach(Array(connections), id: \.self) { connection in
                    Path { path in
                        path.move(to: connection.start)
                        path.addLine(to: connection.end)
                    }
                    .stroke(Color.black, lineWidth: 2)
                }
            }
        }
    }
}

struct Connection: Hashable {
    let start: CGPoint
    let end: CGPoint
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(start)
        hasher.combine(end)
    }
    
    static func == (lhs: Connection, rhs: Connection) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}

struct Photo: Identifiable {
    var id = UUID()
    var name: String
    var image: Image
    var position: CGPoint
}

struct Note: Identifiable {
    var id = UUID()
    var text: String
    var position: CGPoint
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    public static func == (lhs: CGPoint, rhs: CGPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct RBView_Previews: PreviewProvider {
    static var previews: some View {
        RBView()
    }
}

//struct ReportView: View {
//    var photo: Photo
//    
//    var body: some View {
//        Text(photo.name)
//    }
//}
