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
    case types
    case incense

    @ViewBuilder
    static func view(_ selection: MenuType) -> some View {
        switch selection {
        case .gender:
            GenderView()
        case .note:
            NoteView()
        case .types:
            TypesView()
        case .incense:
            IncenseView()
        }
    }
}


let MenuData: [Menu] = [
    Menu(title: "Gender", desc: "Different perfume terms for each gender", image: "Gender", type: .gender),
    Menu(title: "Note", desc: "Changes or stages of fragrance over time", image: "Note", type: .note),
    Menu(title: "Types", desc: "Classification according to the concentration", image: "Perfume", type: .types),
    Menu(title: "Incense", desc: "Incense Types", image: "Smell", type: .incense)
]


