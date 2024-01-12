import SwiftUI


struct bgEffect: Hashable {
    let imageName: String
    let xPos: CGFloat
    let yPos: CGFloat
    let rotate: Angle
    let p1: Double
    let p3: Double
}

struct FirstTabView: View {
    @State private var showAnimation: Bool = false
    @State private var orientation = UIDevice.current.orientation

    let imageName: [String] = ["perfume1", "perfume2", "perfume3", "perfume4"]
    let imageName2: [String] = ["perfume5", "perfume6", "perfume7", "perfume8"]
    var items: [bgEffect] = []
    var items2: [bgEffect] = []
    let top: CGFloat
    let bottom: Int

    init() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let canDraw: Int = Int(((screenWidth / 2) / 50) / 2)

        let top = -screenHeight
        let bottom = Int(-top / 2) - 100
        self.top = top
        self.bottom = bottom

        var xPos: CGFloat = 0
        for i in 0..<(canDraw * 2) {
            if i < canDraw {
                xPos = -CGFloat(i) * 120
            } else if i == canDraw {
                continue
            } else {
                xPos = CGFloat(i % canDraw) * 120
            }
            let yPos: CGFloat = CGFloat(bottom)
            let rotate = Angle.degrees(Double.random(in: 0..<360))
            items.append(bgEffect(imageName: imageName[i % 4], xPos: xPos, yPos: yPos, rotate: rotate, p1: Double.random(in: 0...0.11), p3: Double.random(in: 0...0.5)))
        }

        xPos = 0
        for i in 0..<(canDraw * 2) {
            if i < canDraw {
                xPos = -CGFloat(i) * 100
            } else if i == canDraw {
                continue
            } else {
                xPos = CGFloat(i % canDraw) * 100
            }
            let yPos: CGFloat = CGFloat(bottom - 100)
            let rotate = Angle.degrees(Double.random(in: 0..<360))
            items2.append(bgEffect(imageName: imageName2[i % 4], xPos: xPos, yPos: yPos, rotate: rotate, p1: Double.random(in: 0...0.11), p3: Double.random(in: 0...0.5)))
        }
    }

    var body: some View {
        ZStack {
            ForEach(items, id: \.self) {
                item in
                Image(item.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .rotationEffect(showAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: showAnimation ? item.yPos : top)
                    .animation(
                    Animation.timingCurve(item.p1, 0, item.p3, 0).speed(0.3)
                        .delay(1)
                    , value: showAnimation)
            }
            ForEach(items2, id: \.self) {
                item in
                Image(item.imageName)
                    .resizable()
                    .frame(width: 180, height: 180)
                    .rotationEffect(showAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: showAnimation ? item.yPos : top)
                    .animation(
                    Animation.timingCurve(item.p1, 0, item.p3, 0).speed(0.3)
                        .delay(1.2)
                    , value: showAnimation)
            }

            Text("Do you know perfume well?")
                .font(.system(size: 50, weight: .bold))
                .offset(y: showAnimation ? 0 : 10)
                .opacity(showAnimation ? 1 : 0)
                .animation(.easeInOut(duration: 0.5).delay(2.5), value: showAnimation)
        }
            .onAppear() {
            showAnimation = true
        }
    }
}



