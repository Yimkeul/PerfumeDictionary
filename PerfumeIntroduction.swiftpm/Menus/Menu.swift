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
    case perfume
    case incense

    @ViewBuilder
    static func view(_ selection: MenuType) -> some View {
        switch selection {
        case .gender:
            GenderView(isLeft: true, isAppear: .none)
        case .note:
            Nav2()
        case .perfume:
            Nav1()
        case .incense:
            Nav2()
        }
    }
}


let MenuData: [Menu] = [
    Menu(title: "Gender", desc: "Gender-specific perfume terminology", image: "Gender", type: .gender),
    Menu(title: "Note", desc: "Note description", image: "Note", type: .note),
    Menu(title: "Perfume", desc: "Perfume description", image: "Perfume", type: .perfume),
    Menu(title: "Incense", desc: "Note description", image: "Smell", type: .incense)
]


