//
//  Menu.swift
//  
//
//  Created by yimkeul on 1/18/24.
//

import Foundation
import SwiftUI

struct Menu: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let desc: String
    let image: String
    let type: MenuType
}

enum MenuType: String, CaseIterable {
    case gender
    case note
    case volume
    case fragrance

    @ViewBuilder
    static func view(_ selection: MenuType) -> some View {
        switch selection {
        case .gender:
            GenderView()
        case .note:
            NoteView()
        case .volume:
            VolumeView()
        case .fragrance:
            FragranceView()
        }
    }
}


let MenuData: [Menu] = [
    Menu(title: "Gender", desc: "Different perfume terms for each gender", image: "Gender", type: .gender),
    Menu(title: "Note", desc: "Changes or stages of fragrance over time", image: "Note", type: .note),
    Menu(title: "Volume", desc: "Perfume description", image: "Perfume", type: .volume),
    Menu(title: "Fragrance", desc: "Note description", image: "Smell", type: .fragrance)
]


