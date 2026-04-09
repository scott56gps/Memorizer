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
    var resultText: AttributedString {
        results.reduce(into: AttributedString()) { result, token in
            result.append(token.styledText)
        }
    }
    var hasIncorrectToken: Bool {
        results.contains { .incorrect == $0.correctness }
    }
}

struct RecitationResultToken {
    let text: String
    let correctness: RecitationResultCorrectness
    var styledText: AttributedString {
        var string = AttributedString(text)
        if case .incorrect = self.correctness {
            string.foregroundColor = .red
        }
        return string
    }
}

enum RecitationResultCorrectness: Equatable {
    case correct
    case incorrect
    case neutral
}
