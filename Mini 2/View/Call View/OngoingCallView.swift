//
//  OngoingCallView.swift
//  mini2_bagiannatasha
//
//  Created by Natasha Radika on 20/06/24.
//

import SwiftUI

struct OngoingCallView: View {
    @Environment(\.dismiss) var dismiss
    
    let soundPlayer = SoundPlayer()
    
    let name: String
    let profile: String
    
    @State private var callDuration: TimeInterval = 0
    @State private var timer: Timer? = nil
    
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
                        
            VStack(spacing: 150) {
                VStack(spacing: 10) {
                    Text(name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text(timeString(from: callDuration))
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 0.94, green: 0.89, blue: 0.88))
                }
                
                
                Image(profile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .clipped()
                
                
                Button(action: {
                    endCall()
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
            }
        }
        .onAppear {
            startTimer()
            soundPlayer.playSound(sound: "people_talking", type: "mp3")
        }
        .onDisappear {
            endCall()
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    callDuration += 1
        }
    }
    
    private func endCall() {
        timer?.invalidate()
        timer = nil
    }
        
    private func timeString(from seconds: TimeInterval) -> String {
        let hours = Int(seconds) / 3600
        let minutes = (Int(seconds) % 3600) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    OngoingCallView(name: "Stephanie", profile: "profile")
}
