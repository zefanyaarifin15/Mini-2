import SwiftUI

class PhoneViewModel: ObservableObject {
    @Published var appIcons: [AppIconViewModel] = [
        AppIconViewModel(imageName: "Postingan 2", labelText: "InstaQueen", destination: AnyView(HomeView())),
        AppIconViewModel(imageName: "Postingan 2", labelText: "Board", destination: AnyView(ReportCard())),
        AppIconViewModel(imageName: "Postingan 2", labelText: "Task", destination: AnyView(TaskView())),
        AppIconViewModel(imageName: "Postingan 2", labelText: "Notes", destination: AnyView(NotesView()))
    ]
    
}


