import SwiftUI
import AVFoundation

struct MessageNotification: View {
    @State private var image: String
    @State private var title: String
    @State private var description: String
    @State private var time: String
    @State private var isSecondNotification = false
    
    let soundPlayer = SoundPlayer()
    @State private var isVisible = false
    var disableSecondNotification: Bool
    
    var onSecondNotification: (() -> Void)?
    
    init(image: String, title: String, description: String, time: String, onSecondNotification: (() -> Void)? = nil, disableSecondNotification: Bool = false) {
        self._image = State(initialValue: image)
        self._title = State(initialValue: title)
        self._description = State(initialValue: description)
        self._time = State(initialValue: time)
        self.onSecondNotification = onSecondNotification
        self.disableSecondNotification = disableSecondNotification
    }
    
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
                .transition(.move(edge: .top))
                .animation(.easeInOut, value: isVisible)
                .onAppear {
                    soundPlayer.playSound(sound: "message_notif", type: "mp3")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
            }
        }
        .onAppear {
            withAnimation {
                isVisible = true
            }
            if !disableSecondNotification {
                scheduleNotificationUpdate()
            }
        }
    }
    
    private func scheduleNotificationUpdate() {
        // Menjadwalkan pembaruan notifikasi setelah 30 detik
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            withAnimation {
                isVisible = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                image = "Instaqueen"
                title = "Rose"
                description = "Hi there, how are you holding up today?"
                time = "19:30"
                isSecondNotification = true
                onSecondNotification?()
                withAnimation {
                    isVisible = true
                }
            }
        }
    }
}

struct MessageNotification_Previews: PreviewProvider {
    static var previews: some View {
        MessageNotification(image: "Instaqueen", title: "Stephanie", description: "You got 1K+ comments on your latest post", time: "19:00")
    }
}
