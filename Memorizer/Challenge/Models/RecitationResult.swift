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
    var hasMissedToken: Bool {
        results.contains { .missed == $0.correctness }
    }
}

struct RecitationResultToken {
    let text: String
    let correctness: RecallResult
}

enum RecallResult: Equatable {
    case correct
    case missed
    case unscored
}
