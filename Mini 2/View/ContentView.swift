import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            AnalysisButton(title: "Profile Analysis", isLocked: false) {
                print("Profile Analysis tapped")
            }
            AnalysisButton(title: "Event Analysis", isLocked: false) {
                print("Event Analysis tapped")
            }
            AnalysisButton(title: "Text Analysis", isLocked: true) {
                print("Text Analysis tapped")
            }
            AnalysisButton(title: "Photo Analysis", isLocked: true) {                print("Photo Analysis tapped")
            }
            AnalysisButton(title: "Relationship Analysis", isLocked: true) {
                print("Relationship Analysis tapped")
            }
        }
        .padding()
        .navigationTitle("Analysis Tools")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

