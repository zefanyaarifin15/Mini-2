import SwiftUI

struct DMsView: View {
    @ObservedObject var viewModel: DialogViewModel
    @ObservedObject var viewModel_2: DMsViewModel
    @EnvironmentObject private var progress: UserProgress

    var body: some View {
        VStack {
            List {
                ForEach(viewModel_2.chat, id: \.profileName) { message in
                    
                    if message.profileName == "James" {
                        NavigationLink(destination: JamesChatView(partner: "James")) {
                            HStack {
                                DMsList(profilePicture: message.profilePicture, profileName: message.profileName, textMessage: "")
                            }
                        }
                    } else {
                        
                        NavigationLink(destination: ChatView(viewModel: viewModel, partner: message.profileName, profileName: message.profileName)) {
                            HStack {
                                DMsList(profilePicture: message.profilePicture, profileName: message.profileName, textMessage: "")
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Beautyjasmine", displayMode: .large)
            .onAppear {
                viewModel.loadJSONData()
            }
            
            Button(action: {
                viewModel_2.addNextDM()
                
            }, label: {
                Text(" ")
            })
            
        }
    }
}

struct DMsView_Previews: PreviewProvider {
    static var previews: some View {
        DMsView(viewModel: DialogViewModel(), viewModel_2: DMsViewModel()).environmentObject(UserProgress())
    }
}

/*
 DM:
 - Tambah penanda kalau ada new chat (chat yang blm user buka)
 - Save chats di SwiftData [masih hrs nunggu logic flow chapter]
 - Buat chatnya muncul sesuai alur [masih hrs nunggu logic flow chapter]
*/
