//
//  SwiftUIView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct NoteDialog: View {
    @Binding var isActive: Bool
    @Binding var isS: CGFloat

    @State private var offset: CGFloat = 1000
    @State private var page: Int = 0

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
                Spacer()
                TransBtn()
            }
                .frame(width: isS - 100, height: isS - 200)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .circular))
            /// 닫기 버튼
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
                .padding(30)
                .offset(y: offset)
                .onAppear() {
                withAnimation(.easeIn) {
                    offset = 0
                }
            }
        }
    }

    @ViewBuilder
    private func TopDesc() -> some View {
        VStack(alignment: .leading) {
            Text("Top Note")
                .font(.system(size: 48, weight: .bold))
                .padding(.top, 16)
            Spacer()
            MultiColoredText(originalText: "Also called First Note or Head Note.\nThis is the first scent you smell when you spray perfume and can be said to be your first impression of the perfume. Since it is a scent that appears immediately after trying it on, it is a scent that is difficult for people other than yourself to smell."
                             , coloredSubstrings: [("First Note", .pink), ("Head Note", .pink), ("first impression", .pink)])
                .font(.system(size: 25, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
            Spacer()
            Divider()
            Text("🕒 Duration : spray ~ 30 min\n🏷️ Type : Lighter types of Citrus, Green, Aldehyde, Fruit, Floral etc")
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)

            Spacer()
        }

    }

    @ViewBuilder
    private func MidDesc() -> some View {
        VStack {
            Text("제목2")
                .font(.system(size: 50, weight: .bold))
                .padding(.bottom, 24)
            Text("설명")
                .font(.system(size: 30, weight: .semibold))
            Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
            Spacer()
        }
    }

    @ViewBuilder
    private func BaseDesc() -> some View {
        VStack {
            Text("제목3")
                .font(.system(size: 50, weight: .bold))
                .padding(.bottom, 24)
            Text("설명")
                .font(.system(size: 30, weight: .semibold))
            Text("가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼가낟라ㅏㄹ망러미나얾;니ㅏ얼")
        }
    }

    @ViewBuilder
    private func TransBtn() -> some View {
        HStack {
            Button {
                page -= 1
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .bold))
            }.disabled(page == 0 ? true : false)

            Spacer()

            Button {
                page += 1
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24, weight: .bold))
            }.disabled(page == 2 ? true : false)
        }
            .padding(.horizontal)
            .padding(.bottom, 16)
    }

    private func close () {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }
}

