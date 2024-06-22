//
//  ReportCard.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 19/06/24.
//

import SwiftUI

struct ReportCard: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.brownReport
                                   .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .leading){
                        
                        Image("post4")
                            .resizable()
                            .frame(width: 240, height: 200)
                            .padding(.leading, 5)
                        
                        Text("Stephanie")
                            .foregroundColor(.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 5)
                        
                        DetailView(text: "Profile Picture: A photo of Stephanie.")
                        DetailView(text: "Occupation: beauty influencer.")
                        DetailView(text: "Relationship with Jasmine: Best friend turned backstabber, currently dating James.")
                        DetailView(text: "Motive: Jealousy over Jasmine’s success, feeling of betrayal due to Jasmine's focus on her career.")
                        DetailView(text: "Alibi: Claims to be in the cafe.")
                        DetailView(text: "Background Noise: Car engine, traffic noises, radio.")
                        
                        
                        NavigationLink(destination: ConfirmationReportPage()) {
                            PrimaryButton(text: "Report", width: 150, height: 10, fontSize: 18)
                        }

                        .padding(.top, 5) // Menambahkan padding atas untuk memberikan jarak dari teks terakhir
                        .padding([.leading, .trailing], 10) // Menambahkan padding kiri dan kanan
                        
                        Text("Cancel")
                            .foregroundColor(.button)
                                                .underline()
                                                .padding(.top, 10)
                                                .padding(.leading, 95)
                                                .onTapGesture {
                                                    // Tindakan yang dilakukan ketika "Cancel" diklik
                                                    print("Cancel button clicked")
                                                }
                    }
                    .frame(width: 250, height: 550)
                    .padding()
                    .background(Color.white) // Background isi card
                    .cornerRadius(15) // Sudut melengkung untuk card
                    .shadow(radius: 5)
                }
            }
        }
    }
    
    
    struct DetailView: View {
        var text: String
        
        var body: some View {
            Text(text)
                .foregroundColor(.black)
                .font(.footnote)
                .padding(.leading, 5)
        }
    }
}

#Preview {
    ReportCard()
}
