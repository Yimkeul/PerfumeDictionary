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
    @State private var page:Int = 0
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            
            VStack {
                switch page {
                case 1:
                    MidDesc()
                case 2:
                    BaseDesc()
                default:
                    TopDesc()
                }
                Spacer().frame(maxHeight: 300)
                HStack {
                    Button {
                            page -= 1
                    } label: {
                        Text("<-")
                    }.disabled(page == 0 ? true : false )
                    
                    Spacer()
                    
                    Button {
                            page += 1
                    } label: {
                        Text("->")
                    }.disabled(page == 2 ? true : false )
                    
                    
                }.padding()
            }
            .frame(maxWidth: 700)
            
            .padding()
            .background(.blue)
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
    
    @ViewBuilder
    private func TopDesc() -> some View {
        Text("제목")
            .font(.system(size: 50, weight: .bold))
        Text("설명")
            .font(.system(size: 30, weight: .semibold))
        Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
    }
    
    @ViewBuilder
    private func MidDesc() -> some View {
        Text("제목2")
            .font(.system(size: 50, weight: .bold))
        Text("설명")
            .font(.system(size: 30, weight: .semibold))
        Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
    }
    
    @ViewBuilder
    private func BaseDesc() -> some View {
        Text("제목3")
            .font(.system(size: 50, weight: .bold))
        Text("설명")
            .font(.system(size: 30, weight: .semibold))
        Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
    }
    
    private func close () {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }
}

#Preview {
    Dialog(isActive: .constant(true))
}
