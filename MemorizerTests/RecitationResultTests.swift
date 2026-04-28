//
//  RecitationResultTests.swift
//  MemorizerTests
//
//  Created by Scott Nicholes on 4/10/26.
//

import Testing
@testable import Memorizer
internal import Foundation

struct RecitationResultTests {

    @Test("Styled text preserves token order")
    func styledTextPreservesOrder() {
        let tokens = [
            RecitationResultToken(text: "I", correctness: .correct),
            RecitationResultToken(text: " ", correctness: .unscored),
            RecitationResultToken(text: "Love", correctness: .missed),
        ]
        let result = RecitationResult(results: tokens)
        
        // Extract just the string parts from the styled text
        let actual = String(result.resultText.characters)
        let expected = tokens.map { $0.text }.joined()
        
        #expect(actual == expected, "Result text should be string of tokens in order")
    }

}
