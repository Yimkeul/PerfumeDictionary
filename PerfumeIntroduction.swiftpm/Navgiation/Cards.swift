//
//  File.swift
//
//
//  Created by yimkeul on 1/16/24.
//

import Foundation
import SwiftUI

enum Destination: String, CaseIterable {
    case nav1
    case nav2

    @ViewBuilder
    static func view(_ selection: Destination) -> some View {
        switch selection {
        case nav1:
            Nav1()
        case nav2:
            Nav2()
        }
    }
}

struct Card {
    let Title: String
    let Desc: String
    let Nav: Destination
}

let Cards: [Card] = [
    Card(Title: "History", Desc: "Sample Text 1111 Sample Text 1111 Sample Text 1111 Sample Text 1111", Nav: .nav1),
    Card(Title: "HistoryHistoryHistoryHistory", Desc: "Sample Text 2222 Sample Text 2222 Sample Text 2222 Sample Text 2222", Nav: .nav2),
    Card(Title: "HistoryHistory", Desc: "Sample Text 3333 Sample Text 3333 Sample Text 3333 Sample Text 3333", Nav: .nav1),
    Card(Title: "HistoryHistoryHistory", Desc: "Sample Text 4444", Nav: .nav2),
    Card(Title: "HistoryHistoryHistoryHistoryHistoryHistoryHistoryHistory", Desc: "Sample Text 5555", Nav: .nav1),
    Card(Title: "History", Desc: "Sample Text 6666", Nav: .nav1),
    Card(Title: "History", Desc: "Sample Text 7777", Nav: .nav2)
]
