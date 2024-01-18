//
//  SwiftUIView.swift
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
    let type: MenuType
}

enum MenuType: String, CaseIterable {
    case gender
    case note

    @ViewBuilder
    static func view(_ selection: MenuType) -> some View {
        switch selection {
        case .gender:
            Nav1()
        case .note:
            Nav2()
        }
    }
}


let MenuData: [Menu] = [
    Menu(title: "Gender", desc: "Gender description", type: .gender),
    Menu(title: "Note", desc: "Note description", type: .note)
]


