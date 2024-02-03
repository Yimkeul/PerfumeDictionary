//
//  TypesDialog.swift
//
//
//  Created by yimkeul on 2/4/24.
//

import SwiftUI

struct TypesDialog: View {
    @Binding var isActive: Bool
    var isType: perfumeType

    @State private var offset: CGFloat = -20

    var body: some View {
        ZStack {
            VStack {
                switch isType {
                case .edc:
                    Desc(title: TypesDialogContents[0].title, subTitle: TypesDialogContents[0].subTitle, concentration: TypesDialogContents[0].concentration, duration: TypesDialogContents[0].duration)
                case .edt:
                    Desc(title: TypesDialogContents[1].title, subTitle: TypesDialogContents[1].subTitle, concentration: TypesDialogContents[1].concentration, duration: TypesDialogContents[1].duration)
                case .edp:
                    Desc(title: TypesDialogContents[2].title, subTitle: TypesDialogContents[2].subTitle, concentration: TypesDialogContents[2].concentration, duration: TypesDialogContents[2].duration)
                case .ep:
                    Desc(title: TypesDialogContents[3].title, subTitle: TypesDialogContents[3].subTitle, concentration: TypesDialogContents[3].concentration, duration: TypesDialogContents[3].duration)

                }
            }
                .padding(.horizontal, 32)
                .padding(.vertical, 40)
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
                                .font(.system(size: 24))
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
                    withAnimation(.linear) {
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
    private func Desc(title: String, subTitle: String, concentration: String, duration: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 32, weight: .bold))
            Text(subTitle)
            Text("💧 Concentration : \(concentration)")
                .font(.system(size: 24))
                .padding(.top, 16)
            Text("🕒 Duration : \(duration)")
                .font(.system(size: 24))
        }
            .foregroundStyle(.black)

    }

    private func close () {
        withAnimation(.linear) {
            offset = -20
            isActive = false
        }
    }
}
