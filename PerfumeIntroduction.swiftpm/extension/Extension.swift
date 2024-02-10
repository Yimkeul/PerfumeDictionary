//
//  Extension.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/13/24.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum SoundOption: String {
        case perfume = "perfumeSound"
        case drop = "drop"
    }

    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else {
            print("false")
            return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }

}


extension Color {
    static let BG = Color("BG")
    static let Water1 = Color("Water1")
    static let Water2 = Color("Water2")
    static let Water3 = Color("Water3")
    static let Water4 = Color("Water4")
    static let Disable = Color("Disable")
}
