//
//  NoteDialogContent.swift
//  
//
//  Created by yimkeul on 1/29/24.
//

import SwiftUI
import Foundation

struct NoteDialogContent {
    let title: String
    let desc: String
    let point: [(String, Color)]
    let subDesc: String
}

let NoteDialogContents = [
    NoteDialogContent(title: "Top Note", desc: "Also called First Note or Head Note.\nThis is the first scent you smell when you spray perfume and can be said to be your first impression of the perfume. Since it is a scent that appears immediately after trying it on, it is a scent that is difficult for people other than yourself to smell.", point: [("First Note", .pink), ("Head Note", .pink), ("first impression", .pink)], subDesc: "🕒 Duration : spray ~ 30 min\n🏷️ Type : Clean, Citrus, Water, Fruit etc.\n💧 Percent of Concentrate : 30%"),
    NoteDialogContent(title: "Middle Note", desc: "Also called Soul Note or Heart Note, it is a middle scent that helps create harmony when combining several scents.\nThe volatilization speed is the second fastest after the top notes, and the theme and character of the perfume stand out the most.", point: [("Soul Note", .pink), ("Heart Note", .pink), ("theme", .pink), ("character", .pink)], subDesc: "🕒 Duration : 30 ~ 60 min after spray\n🏷️ Type : Green, Herbal, Floral, Smoke, Incense, Rose, Spice\n💧 Percent of Concentrate : 50%"),
    NoteDialogContent(title: "Base Note", desc: "Also called Last Note or Bottom Note. It has the slowest volatilization rate, making it a scent you can smell until the end.\nIt is also commonly called lingering scent because it plays the role of holding oil mixed with various scents on the skin.", point: [("Last Note", .pink), ("Bottom Note", .pink), ("lingering scent", .pink)], subDesc: "🕒 Duration : 2 hours ~ after spray\n🏷️ Type : Leather, Vanilla, Chocolate, Wood, Earth, Musk etc\n💧 Percent of Concentrate : 20%"),
]




