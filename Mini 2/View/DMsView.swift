import SwiftUI

struct DMsView: View {
    @ObservedObject var viewModel: DialogViewModel
    @ObservedObject var viewModel_2: DMsViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel_2.chat, id: \.profileName) { message in
                        NavigationLink(destination: ChatView(viewModel: viewModel, partner: message.profileName)) {
                            HStack {
                                DMsList(profilePicture: message.profilePicture, profileName: message.profileName, textMessage: "..")
                                }
                            }
                        }
                    }
                
                Button(action: {
                    viewModel_2.addDM(.natalie)
                }, label: {
                    Text("Button")
                })
                
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                .navigationBarTitle("Beautyjasmine", displayMode: .large)
                .onAppear {
                    viewModel.loadJSONData()
                }
            }
        }
    }


struct DMsView_Previews: PreviewProvider {
    static var previews: some View {
        DMsView(viewModel: DialogViewModel(), viewModel_2: DMsViewModel())
    }
}
