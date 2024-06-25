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
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            if isVisible {
                HStack {
                    Image(image).resizable().frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.black)
                            Spacer()
                            Text(time)
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 94/255, green: 89/255, blue: 88/255))
                                .foregroundColor(.black)
                        }
                        Text(description)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .frame(width: 370)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 168/255, green: 165/255, blue: 164/255))
                        .opacity(100)
                        .shadow(radius: 5)
                )
                .transition(.move(edge: .top))
                .animation(.easeInOut, value: isVisible)
                .onAppear() {
                    soundPlayer.playSound(sound: "message_notif", type: "mp3")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
            }
        }
        .onAppear() {
            withAnimation {
                isVisible = true
            }
        }
    }
}

#Preview {
    MessageNotification(image: "icon", title: "Stephanie", description: "You got 1K+ comments on your latest post", time: "19:00")
}
