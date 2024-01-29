//
//  SwiftUIView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct NoteDialog: View {
    @Binding var isActive: Bool
//    @Binding var isS: CGFloat
    var isType: noteType

    @State private var offset: CGFloat = 1000

    var body: some View {
        ZStack {
            VStack {
                switch isType {
                case .top:
                    Desc(title: NoteDialogContents[0].title, desc: NoteDialogContents[0].desc, point: NoteDialogContents[0].point, subDesc: NoteDialogContents[0].subDesc)
                case .mid:
                    Desc(title: NoteDialogContents[1].title, desc: NoteDialogContents[1].desc, point: NoteDialogContents[1].point, subDesc: NoteDialogContents[1].subDesc)
                case .base:
                    Desc(title: NoteDialogContents[2].title, desc: NoteDialogContents[2].desc, point: NoteDialogContents[2].point, subDesc: NoteDialogContents[2].subDesc)
                }
            }.frame(width: 600, height: 600)
                .padding(24)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .circular))
                .overlay {
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 24, weight: .bold))
                        }
                            .tint(.black)
                        Spacer()
                    }
                }
                    .padding()
            }
                .shadow(radius: 20)
            .offset(y: offset)
                .onAppear() {
                withAnimation(.easeIn) {
                    offset = 0
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            Color.black
                .opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                close()
            })

    }

    @ViewBuilder
    private func Desc(
        title: String,
        desc: String,
        point: [(String, Color)],
        subDesc: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 48, weight: .bold))
                .padding(.top, 16)
            Spacer()
            MultiColoredText(originalText: desc
                             , coloredSubstrings: point)
                .font(.system(size: 25))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
            Spacer()
            Divider()
                .padding(.bottom, 16)
            Text(subDesc)
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
            Spacer()
        }
            .padding()

    }

    private func close () {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }
}

