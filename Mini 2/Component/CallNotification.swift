//
//  CallNotificationView.swift
//  mini2_bagiannatasha
//
//  Created by Natasha Radika on 24/06/24.
//


import SwiftUI

struct CallNotification: View {
    let profile: String
    let name: String
    @Binding var showGameOverText: Bool
    @StateObject private var soundPlayer = SoundPlayer()
    @Binding var showCallNotification: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image("Stephanie Profile&Post")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text("InstaQueen")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                
                Text(name)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.black)
                
            }
            
            HStack(spacing: 0) {
                Button(action: {
                    // Action when reject button is tapped
                    print("Call Rejected")
                    soundPlayer.stopSound() // Hentikan suara
                    showGameOverText = true
                    
                    //ilangin notif kalo udah di reject
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            showCallNotification = false
                    }
                }) {
                    Image(systemName: "phone.down.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(17)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                
                NavigationLink {
                    OngoingCallView(name: name, profile: profile)
                } label: {
                    Image(systemName: "phone.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
        }
        .onAppear {
            soundPlayer.playSound(sound: "ring_call", type: "mp3")
        }
        .padding()
        .frame(width: 370)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 168/255, green: 165/255, blue: 164/255))
                .opacity(0.6)
                .shadow(radius: 5)
        )
        .padding()
    }
}

#Preview {
    CallNotification(profile: "profile", name: "Stephanie",  showGameOverText: .constant(false), showCallNotification: .constant(true))
}
