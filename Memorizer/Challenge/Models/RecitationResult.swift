//
//  RecitationResult.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/7/26.
//
import Foundation
import SwiftUI

struct RecitationResult {
    let results: [RecitationResultToken]
    let styler: TokenStyling = DefaultTokenStyler()
    var resultText: AttributedString {
        results.reduce(into: AttributedString()) { result, token in
            result.append(styler.style(token))
        }
    }
    var hasIncorrectToken: Bool {
        results.contains { .incorrect == $0.correctness }
    }
}

struct RecitationResultToken {
    let text: String
    let correctness: RecitationResultCorrectness
}

enum RecitationResultCorrectness: Equatable {
    case correct
    case incorrect
    case neutral
}
