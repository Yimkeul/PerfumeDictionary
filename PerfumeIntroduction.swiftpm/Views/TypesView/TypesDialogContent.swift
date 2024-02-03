//
//  SwiftUIView.swift
//  
//
//  Created by yimkeul on 2/4/24.
//

import SwiftUI

struct TypesDialogContent {
    let title:String
    let subTitle:String
    let concentration: String
    let duration: String
}

let TypesDialogContents = [
    TypesDialogContent(title: "Eau De Cologne", subTitle: "EDC", concentration: "3~5%", duration: "2~3 hours"),
    TypesDialogContent(title: "Eau De Toillete", subTitle: "EDT", concentration: "5~8%", duration: "4~5 hours"),
    TypesDialogContent(title: "Eau De Perfume", subTitle: "EDP", concentration: "8~15%", duration: "5~6 hours"),
    TypesDialogContent(title: "(Extrait) Perfume", subTitle: "EP , Perfume", concentration: "15~30%", duration: "6~8 hours")
]
