//
//  GenderView.swift
//
//
//  Created by yimkeul on 1/20/24.
//

import SwiftUI

enum genderType {
    case man
    case woman
}

struct GenderView: View {
    @State var genderType: genderType = .man
    @State var isActive: Bool = false

    var body: some View {
        VStack{
            Spacer()
            Text("Different perfume terms for each gender")
                .font(.title)
                
            Text("Let's explore the fragrance terminology related to gender that is sometimes incorporated into the names of perfumes.")
                .font(.subheadline)
            Text("\nPlease click on the image")
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    genderType = .man
                    isActive = true
                } label: {
                    VStack {
                        Text("💁‍♂️")
                            .font(.system(size: 150, weight: .bold))
                    }
                }
                Spacer()
                Button {
                    genderType = .woman
                    isActive = true
                } label: {
                    VStack {
                        Text("💁‍♀️")
                            .font(.system(size: 150, weight: .bold))
                    }
                }
                Spacer()
            }
            Spacer()
            Text("In recent years, gender-neutral perfumes have been widely introduced, so the terms mentioned above may not be used as commonly. Just keep that in mind.")
            Spacer()
        }
            .onAppear() {
            isActive = false
        }
        
        
        
        if isActive {
            GenderDialog(genderType: $genderType, isActive: $isActive)
        }
    }
}

#Preview {
    GenderView()
}
