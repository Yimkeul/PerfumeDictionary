//
//  SwiftUIView.swift
//  
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct Dialog: View {
    @Binding var isActive:Bool
    @State private var offset: CGFloat = 1000
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text("제목")
                    .font(.system(size: 50, weight: .bold))
                Text("설명")
                    .font(.system(size: 30, weight: .semibold))
                Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
            }
            .frame(maxWidth: 700)
            
            .padding()
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .circular))
            .overlay {
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            close()
                        } label: {
                            Text("X")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .tint(.black)
                        Spacer()
                    }
                }
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(y : offset)
            .onAppear() {
                withAnimation(.easeIn) {
                    offset = 0
                }
            }
        }
        
    }
    
    private func close () {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }
}

//#Preview {
//    Dialog(isActive: <#Binding<Bool>#>)
//}
