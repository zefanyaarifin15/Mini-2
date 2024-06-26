import SwiftUI

class PhoneViewModel: ObservableObject {
    @Published var appIcons: [AppIconViewModel] = [
        AppIconViewModel(imageName: "Instaqueen", labelText: "InstaQueen", destination: AnyView(HomeView())),
        AppIconViewModel(imageName: "R&B", labelText: "Board", destination: AnyView(RBView())),
        AppIconViewModel(imageName: "Task", labelText: "Task", destination: AnyView(TaskView())),
        AppIconViewModel(imageName: "Notes", labelText: "Notes", destination: AnyView(NotesView()))
    ]
    
}


