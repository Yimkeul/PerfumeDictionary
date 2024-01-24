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
    static let Rope = Color("Rope")
    static let BGStroke = Color("BGStroke")
    static let Intro2 = Color("Intro2")
}

let CWidth: CGFloat = 700
let CHeight: CGFloat = 1000


/// trash code
//     private func Perfume() -> some View {
//VStack(spacing: 0) {
//    Rectangle()
//        .fill(Color.black)
//        .frame(width: 50, height: 30)
//    Rectangle()
//        .fill(Color.black)
//        .frame(width: 100, height: 50)
//
//    ZStack() {
//        Rectangle()
//            .fill(Color.white)
//            .frame(width: 260, height: 460)
//            .clipShape(RoundedRectangle(cornerRadius: 24.0, style: .continuous))
//            .shadow(radius: 5 , x: 0, y: 10)
//        Rectangle()
//            .stroke(Color.black, lineWidth: 8)
//            .frame(width: 200, height: 400)
//
//        Rectangle()
//            .stroke(Color.black, lineWidth: 4)
//            .frame(width: 160, height: 360)
//    }
//}
//
//}
//private func View() -> some View {
//HStack {
//    ZStack {
//        VStack {
//            Text("Push me")
//            Text("👇")
//        }
//            .font(.system(size: 16, weight: .bold))
//            .offset(y: isAnimation ? (-250) - 70 : (-250) - 50)
//            .animation(
//                .linear(duration: 1)
//                .repeatForever(autoreverses: true)
//            , value: isAnimation
//        )
//        Perfume()
//            .onTapGesture {
//                withAnimation(.easeInOut(duration: 1)) {
//                    isWind = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                        isWind = false
//                    }
//                }
//            }
//    }.disabled(isWind ? true: false)
//
//    Image("Wind")
//        .resizable()
//        .frame(width: CWidth, height : 100)
//        .scaledToFit()
//        .mask {
//        Rectangle()
//            .frame(width: CWidth, height: CWidth)
//            .offset(x: isWind ? CWidth : -CWidth)
//        }.offset(x: -100, y : -265)
//}
//}
