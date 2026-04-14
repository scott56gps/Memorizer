//
//  DefaultTokenStyler.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/9/26.
//
import SwiftUI

struct DefaultTokenStyler: TokenStyling {
    func style(_ token: RecitationResultToken) -> AttributedString {
        var styledText = AttributedString(token.text)
        styledText.foregroundColor = token.correctness == .incorrect ? Color.red : Color.primary
        return styledText
    }
}
