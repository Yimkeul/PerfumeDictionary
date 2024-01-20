//
//  NoteView.swift
//
//
//  Created by yimkeul on 1/21/24.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        VStack {
            Text("Note represents the changes or stages of fragrance over tiem")
            Text("""
                 Typically categorized into Top, Mid, and Base. Shall we explore the fragrance together by clicking on it?
                 """)
            HStack {
                Button{
                  print("click")
                } label: {
                    Image("Perfume")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1 , y: 1)
                        .frame(width: 50)
                }

                Image("Wind")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Image("Person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                
                Image("Exclamation")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            }
        }
    }
}

#Preview {
    NoteView()
}
