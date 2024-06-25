import SwiftUI

struct PhoneView: View {
    @StateObject private var viewModel = PhoneViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("PhoneBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    appRow
                    Spacer()
                    
                }.padding(.top, 80)
            }
        }.statusBar(hidden: false)
    }
    
    var appRow: some View {
        HStack(spacing: 30) {
            ForEach(viewModel.appIcons, id: \.labelText) { appIcon in
                appIconView(imageName: appIcon.imageName, labelText: appIcon.labelText, destinationApp: appIcon.destination)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 30)
    }
    
    func appIconView<Destination: View>(imageName: String, labelText: String, destinationApp: Destination) -> some View {
        NavigationLink(destination: destinationApp) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(14)
                
                Text(labelText)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
            }
        }
    }
    
    
}

struct BoardView: View {
    var body: some View {
        NavigationLink(destination: RBView()) { // Navigasi ke ReportCard
                    
                }
    }
}
struct TaskView: View {
    var body: some View {
        Text("Task app")
    }
}
struct NotesView: View {
    var body: some View {
        Text("dummy Notes app")
    }
}


struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView()
    }
}
