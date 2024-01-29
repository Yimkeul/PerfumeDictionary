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
                Group {
                    Text("Changes or stages of fragrance over time")
                        .font(.system(.title, weight: .bold))
                        .padding(.bottom, 16)
                
                    Text("Typically categorized into Top, Middle, and Base. Shall we explore the fragrance together by clicking on it?")
                        .font(.title2)
                }
                    .foregroundStyle(.black)
                Spacer()
                VStack {
                    switch notePage {
                    case 1:
                        MidNoteView(isActive: $isActive, isType: type)
                    case 2:
                        BaseNoteView(isActive: $isActive, isType: type)
                    default:
                        TopNoteView(isActive: $isActive, isType: type)
                    }
                }.frame(height: 300)
                Spacer()
                TransBtn()
                Spacer()
            }.padding()
            if isActive {
                NoteDialog(isActive: $isActive, isType: type)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitleDisplayMode(.inline)
        .background(
        Image("BGImg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    )
            .onAppear() {
            isActive = false
        }
    }

    @ViewBuilder
    private func TransBtn() -> some View {
        HStack {
            Button {
                notePage -= 1
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 40, weight: .bold))
            }.disabled(notePage == 0 ? true : false)

            Spacer()
            Text("✨Touch Exclamation Mark✨")
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Button {
                notePage += 1
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 40, weight: .bold))
            }.disabled(notePage == 2 ? true : false)
        }
            .padding(.horizontal)
    }
}

#Preview {
    NoteView()
}
