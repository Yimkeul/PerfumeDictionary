//
//  NoteView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

enum noteType {
    case top
    case mid
    case base
}

struct NoteView: View {
    @State private var notePage: Int = 0
    @State var isActive: Bool = false
    @State var isW: CGFloat = UIScreen.main.bounds.width
    @State var isH: CGFloat = UIScreen.main.bounds.height
    @State var isS: CGFloat = 0
    
    var type: noteType {
           switch notePage {
           case 1:
               return .mid
           case 2:
               return .base
           default:
               return .top
           }
       }

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Group {
                    Text("Changes or stages of fragrance over time")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                    Text("Typically categorized into Top, Middle, and Base.")
                        .font(.title2)
                    Text("Shall we explore the fragrance together by clicking on it?")
                        .font(.title2)
                    
                    Text("✨Touch Exclamation Mark✨")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 8)
                }
                    .foregroundStyle(.black)
                Spacer().frame(maxHeight: 120)
                
                VStack(spacing: 100) {
                    switch notePage {
                    case 1:
                        MidNoteView(isActive: $isActive, isType: type)
                    case 2:
                        BaseNoteView(isActive: $isActive, isType: type)
                    default:
                        TopNoteView(isActive: $isActive, isType: type)
                        
                    }
                    TransBtn()
                }
            
                Spacer()
            }
                .padding()
                .frame(width: isS)

            if isActive {
                NoteDialog(isActive: $isActive, isS: $isS, isType: type)
            }
            
        }
            .onAppear() {
            isActive = false
            isS = min(isW, isH)
        }
            .onChange(of: UIScreen.main.bounds.size) { _ in
            isW = UIScreen.main.bounds.width
            isH = UIScreen.main.bounds.height
            isS = min(isW, isH)
        }
    }
    
    @ViewBuilder
    private func TransBtn() -> some View {
        HStack {
            Button {
                notePage -= 1
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .bold))
            }.disabled(notePage == 0 ? true : false)

            Spacer()

            Button {
                notePage += 1
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24, weight: .bold))
            }.disabled(notePage == 2 ? true : false)
        }
            .padding(.horizontal)
            .padding(.bottom, 16)
    }

    
}

#Preview {
    NoteView()
}
