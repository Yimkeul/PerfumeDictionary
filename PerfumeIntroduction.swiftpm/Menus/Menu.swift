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
    case Types
    case fragrance

    @ViewBuilder
    static func view(_ selection: MenuType) -> some View {
        switch selection {
        case .gender:
            GenderView()
        case .note:
            NoteView()
        case .Types:
            TypesView()
        case .fragrance:
            FragranceView()
        }
    }
}


let MenuData: [Menu] = [
    Menu(title: "Gender", desc: "Different perfume terms for each gender", image: "Gender", type: .gender),
    Menu(title: "Note", desc: "Changes or stages of fragrance over time", image: "Note", type: .note),
    Menu(title: "Types", desc: "Classification according to the concentration", image: "Perfume", type: .Types),
    Menu(title: "Fragrance", desc: "Note description", image: "Smell", type: .fragrance)
]


