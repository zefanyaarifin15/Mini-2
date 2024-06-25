//
//  Episode1View.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 25/06/24.
//

import SwiftUI

struct Episode1View: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    PhoneView().overlay{
                        VStack{
                            NavigationLink(destination: DMsView(viewModel: DialogViewModel(), viewModel_2: DMsViewModel())) {
                                                        MessageNotification(image: "icon", title: "Stephanie", description: "Hi, how are you?", time: "19:00")
                                                    }
                            Spacer()
                        }
                    }
                    
                 // Memanggil PhoneView untuk menampilkan layar
                   
//                    Spacer()
                    
                }
            }
//            .navigationBarTitle("Episode 1", displayMode: .inline)

        }
        
    }
}

struct Episode1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1View()
    }
}

