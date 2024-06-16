//
//  SoundViewModel.swift
//  Mini 2
//
//  Created by Haliza Syafa Oktaviani on 16/06/24.
//

import Foundation
import AVFoundation

class SoundViewModel: ObservableObject {
    @Published var stalkerVoice: [Sound] = [
        Sound(id: "0", title: "Sound1", filename: "Sound1")
    ]
    
    private var player: AVAudioPlayer?

    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }
}


