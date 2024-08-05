import SwiftUI
import AVFoundation
 
struct MessageNotification: View {
    let image: String
    let title: String
    let description: String
    let time: String
    
    @State private var isVisible = false
    @State private var dragOffset = CGSize.zero
    let soundPlayer = SoundPlayer()

    var body: some View {
        VStack {
            if isVisible {
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.black)
                            Spacer()
                            Text(time)
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 94/255, green: 89/255, blue: 88/255))
                        }
                        Text(description)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
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
                .transition(.move(edge: .leading))
                .animation(.easeIn, value: isVisible)
                .onAppear {
                    soundPlayer.playSound(sound: "message_notif", type: "mp3")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
                .offset(x: dragOffset.width)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width < 0 {
                                dragOffset = value.translation
                            }
                        }
                        .onEnded { value in
                            if value.translation.width < -100 {
                                withAnimation {
                                    isVisible = false
                                    dragOffset = .zero
                                }
                            } else {
                                withAnimation {
                                    dragOffset = .zero
                                }
                            }
                        }
                )
            }
            Spacer()
        }
        .onAppear {
            withAnimation {
                isVisible = true
            }
        }
    }
}

#Preview {
    MessageNotification(image: "icon", title: "test", description: "test", time: "19:00")
}


/*
 View Notifikasi:
 - Rapihin animation pas muncul v
 - Tambah drag gesture untuk user hapus notif (swipe up)
 - Bisa otomatis ilang setelah 5 detik v
 - Sound muncul cukup sekali pas muncul v
 - Input: image, title, desc v
 - Output: Notif muncul (animasi+sound) -> user bisa swipe up / user bisa tunggu ilang otomatis v
*/
