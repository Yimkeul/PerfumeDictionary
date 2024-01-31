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
    static let Water = Color("Water")
    static let Disable = Color("Disable")
}
