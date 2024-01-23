//
//  NoteView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct NoteView: View {
    @State private var isAnimation: Bool = false
    @State private var isWind: Bool = false
    @State var isActive: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Note represents the changes or stages of fragrance over tiem")
                    .foregroundStyle(.black)
                Text("""
                     Typically categorized into Top, Mid, and Base. Shall we explore the fragrance together by clicking on it?
                     """)
                .foregroundStyle(.black)
                Spacer()
                HStack {
                    Perfume(isAnimation: $isAnimation, isWind: $isWind)

                    Image("Person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)

                    Button {
                        isActive = true
                    } label: {
                        Image("Exclamation")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                }
                Spacer()
            }
                .onAppear() {
                isAnimation = true
                isActive = false
            }
            if isActive {
                Dialog(isActive: $isActive)
            }
        }
    }
}

#Preview {
    NoteView()
}
