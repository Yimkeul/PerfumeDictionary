import Foundation
import SwiftUI


struct BGEffectData: Hashable {
    let imageName: String
    let xPos: CGFloat
    let yPos: CGFloat
    let rotate: Angle
    let p1: Double
    let p3: Double
}

struct OnboardEffect {
    let imageName: [String] = ["perfume1", "perfume2", "perfume3", "perfume4"]
    let imageName2: [String] = ["perfume5", "perfume6", "perfume7", "perfume8"]
    let pos: CGFloat = 1366
    var items1: [BGEffectData] = []
    var items2: [BGEffectData] = []
    
    mutating func setItem() {
        for i in 0 ... 13 {
            var xPos: CGFloat = 0
            let yPos: CGFloat = pos
            let rotate = Angle.degrees(Double.random(in: 0..<360))
            if i < 6  {
                xPos = -CGFloat(i) * 120
            } else if i == 6 {
                continue
            } else {
                xPos = CGFloat(i % 6) * 120
            }
            items1.append(BGEffectData(imageName: imageName[i % 4], xPos: xPos, yPos: yPos, rotate: rotate, p1: Double.random(in: 0...0.11), p3: Double.random(in: 0...0.5)))
            items2.append(BGEffectData(imageName: imageName2[i % 4], xPos: xPos, yPos: yPos, rotate: rotate, p1: Double.random(in: 0...0.11), p3: Double.random(in: 0...0.5)))
            
        }
    }
}
