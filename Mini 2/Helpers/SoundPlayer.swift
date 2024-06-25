//
//  SoundPlayer.swift
//  mini2_bagiannatasha
//
//  Created by Natasha Radika on 24/06/24.
//

import Foundation
import AVFoundation

class SoundPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not play the sound file.")
            }
        }
    }
    
    // play the morse code
    
    func playMorseCode(_ code: String) {
        let morseCharacters = Array(code)
        playNextCharacter(morseCharacters)
    }

    func stopSound() {
        audioPlayer?.stop()
    }
    
    private func playNextCharacter(_ characters: [Character]) {
        guard !characters.isEmpty else { return }

        var characters = characters
        let character = characters.removeFirst()

        let delay: TimeInterval
        switch character {
        case ".":
            playSound(sound: "dot", type: "mp3")
            delay = 0.2
        case "-":
            playSound(sound: "dash", type: "mp3")
            delay = 0.6
        case " ":
            delay = 0.2 // Short delay for space between letters
        case "|":
            delay = 1.0 // Long delay for space between words
        default:
            delay = 0.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.playNextCharacter(characters)
        }
    }
}

