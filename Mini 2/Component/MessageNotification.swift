//
//  MessageNotificationView.swift
//  mini2_bagiannatasha
//
//  Created by Natasha Radika on 24/06/24.
//

import SwiftUI
import AVFoundation

struct MessageNotification: View {
    let image: String
    let title: String
    let description: String
    let time: String
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        HStack {
            Image(image).resizable().frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                    Text(time)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 94/255, green: 89/255, blue: 88/255))
                }
                Text(description)
                    .font(.system(size: 15))
            }
            
        }
        .onAppear() {
            soundPlayer.playSound(sound: "message_notif", type: "mp3")
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
    MessageNotification(image: "icon", title: "Stephanie", description: "Hi how are u", time: "19:00")
}
