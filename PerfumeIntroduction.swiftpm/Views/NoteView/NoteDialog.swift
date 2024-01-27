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
    var isType: noteType

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
                switch isType {
                case .top:
                    TopDesc()
                case .mid:
                    MidDesc()
                case .base:
                    BaseDesc()
                }
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
                .padding(.bottom, 16)
            Text("🕒 Duration : spray ~ 30 min\n🏷️ Type : Clean, Citrus, Water, Creamy, Edible, Fruit etc.\n💧 Percent of Concentrate : 30%")
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)

            Spacer()
        }

    }

    @ViewBuilder
    private func MidDesc() -> some View {
        VStack(alignment: .leading) {
            Text("Middle Note")
                .font(.system(size: 48, weight: .bold))
                .padding(.top, 16)
            Spacer()
            MultiColoredText(originalText: "Also called Soul Note or Heart Note, it is a middle scent that helps create harmony when combining several scents.\nThe volatilization speed is the second fastest after the top notes, and the theme and character of the perfume stand out the most."
                             , coloredSubstrings: [("Soul Note", .pink), ("Heart Note", .pink), ("theme", .pink), ("character", .pink)])
                .font(.system(size: 25, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
            Spacer()
            Divider()
                .padding(.bottom, 16)
            Text("🕒 Duration : 30 ~ 60 min after spray\n🏷️ Type : Green, Herbal, Light Floral, Heavy Floral, Smoke, Incense, Rose, Spice\n💧 Percent of Concentrate : 50%")
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)

            Spacer()
        }
    }

    @ViewBuilder
    private func BaseDesc() -> some View {
        VStack(alignment: .leading) {
            Text("Base Note")
                .font(.system(size: 48, weight: .bold))
                .padding(.top, 16)
            Spacer()
            MultiColoredText(originalText: "Also called Last Note or Bottom Note. It has the slowest volatilization rate, making it a scent you can smell until the end.\nIt is also commonly called lingering scent because it plays the role of holding oil mixed with various scents on the skin."
                             , coloredSubstrings: [("Last Note", .pink), ("Bottom Note", .pink), ("lingering scent", .pink)])
                .font(.system(size: 25, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)
            Spacer()
            Divider()
                .padding(.bottom, 16)
            Text("🕒 Duration : 2 hours ~ after spray\n🏷️ Type : Animalistic, Leather, Vanilla, Chocolate, Wood, Earth, Musk etc\n💧 Percent of Concentrate : 20%")
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.leading)
                .lineSpacing(10.0)

            Spacer()
        }
    }

    private func close () {
        withAnimation(.easeOut) {
            offset = 1000
            isActive = false
        }
    }
}

