//
//  CardView.swift
//  PerfumeIntroduction
//
//  Created by yimkeul on 1/15/24.
//

import SwiftUI


struct CardView: View {
    let Title: String = "HHH"
    var body: some View {
        ZStack {
            GeometryReader {
                geo in
                let top:CGFloat = geo.size.width / 2
                let left:CGFloat = geo.size.height / 2
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 100, height: 50)
                    .offset(x:100, y:50)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 250, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                    .offset(x: 25)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .offset(y:100)
                    .shadow(radius: 5, y: 10)
                    
                
                line(top, left + 100)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 250, height: 450)
                    .offset(x: 25, y: 125)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 5).offset(x: 25, y: 125))
                    

                Rectangle()
                    .fill(Color.white)
                    .frame(width: 225, height: 425)
                    .offset(x: 37.5, y: 137.5)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 2).offset(x: 37.5, y: 137.5))
            
            }
        }
        .frame(width: 300, height: 600)
        
        

    }
    
    @ViewBuilder
    private func line(_ top:CGFloat, _ left:CGFloat) -> some View {
        ZStack{
            Path { path in
                path.move(to: CGPoint(x: top, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left))
                path.closeSubpath()
            }
            .stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))
            
            Path { path in
                path.move(to: CGPoint(x: top + 30, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left + 50))
                path.closeSubpath()
            }
            .stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))
            
            Path { path in
                path.move(to: CGPoint(x: top + 60, y: 105))
                path.addLine(to: CGPoint(x: 5, y: left + 100))
                path.closeSubpath()
            }.stroke(.black, style: StrokeStyle(lineWidth: 10, lineJoin: .round))
        }
    }
}

#Preview {
    CardView()
}
