//
//  IncomingCallView.swift
//  mini2_bagiannatasha
//
//  Created by Natasha Radika on 23/06/24.
//

import SwiftUI

struct IncomingCallView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    let profile: String
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.gray,
                    Color(red: 0.2, green: 0, blue: 0.4),
                    Color(red: 0, green: 0, blue: 0.4),
                    Color.black
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
                        
            VStack(spacing: 260) {
                

                VStack(spacing: 30) {
                   
                    
                    VStack(spacing: 10) {
                        Text("Incoming Call...")
                            .font(.system(size: 18))
                            .foregroundColor(Color(red: 0.94, green: 0.89, blue: 0.88))
                        Text(name)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)
                        
                        
                    }
                    Image(profile)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .clipped()
                    
                }
                
                HStack(spacing: 100) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "phone.down.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(25)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    
                    NavigationLink {
                        OngoingCallView(name: name, profile: profile)
                    } label: {
                        Image(systemName: "phone.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color.green)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                
            }
        }
        .onAppear() {
            soundPlayer.playSound(sound: "ring_call", type: "mp3")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    IncomingCallView(name: "Stephanie", profile: "profile")
}
