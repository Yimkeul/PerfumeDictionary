//
//  SwiftUIView.swift
//  
//
//  Created by yimkeul on 1/26/24.
//

import SwiftUI

struct TextWithColoredSubstring: View {
    var originalText: String
    var coloredSubstring: String
    
    var body: some View {
        if let coloredRange = originalText.range(of: coloredSubstring) {
            let beforeRange = originalText[..<coloredRange.lowerBound]
            let coloredText = originalText[coloredRange]
            let afterRange = originalText[coloredRange.upperBound...]
            
            return Text(beforeRange)
                .foregroundColor(.black)
                + Text(coloredText)
                    .foregroundColor(.pink)
                + Text(afterRange)
                    .foregroundColor(.black)
        } else {
            return Text(originalText)
                .foregroundColor(.black)
        }
    }
}


struct MultiColoredText: View {
    var originalText: String
    var coloredSubstrings: [(String, Color)]
    
    var body: some View {
        var currentIndex = originalText.startIndex
        var result: Text = Text("")
        
        for (substring, color) in coloredSubstrings {
            if let range = originalText.range(of: substring, range: currentIndex ..< originalText.endIndex) {
                let beforeRange = originalText[currentIndex ..< range.lowerBound]
                let coloredText = originalText[range]
                
                result = result + Text(beforeRange)
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                result = result + Text(coloredText)
                    .foregroundColor(color)
                    .fontWeight(.medium)
                
                currentIndex = range.upperBound
            }
        }
        
        let remainingText = originalText[currentIndex...]
        result = result + Text(remainingText)
            .foregroundColor(.black)
        
        return result
    }
}
