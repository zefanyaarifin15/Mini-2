import SwiftUI

struct DMsView: View {
    @ObservedObject var viewModel = DialogViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.fetchPartners(), id: \.self) { partner in
                NavigationLink(destination: {
                    ChatView(viewModel: viewModel, partner: partner)
                }) {
                    DMsList(profilePicture: "James", profileName: partner, textMessage: "No messages yet")
                }
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationBarTitle("beautyjasmine", displayMode: .large)
            .navigationBarHidden(false)
            .onAppear {
                viewModel.loadJSONData()
            }
        }
    }
}

struct DMsView_Previews: PreviewProvider {
    static var previews: some View {
        DMsView()
    }
}
