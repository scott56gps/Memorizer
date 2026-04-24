//
//  DefaultTokenStylerTests.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/10/26.
//

import Testing
internal import Foundation
internal import SwiftUI
@testable import Memorizer

struct DefaultTokenStylerTests {
    let target = DefaultTokenStyler()
    
    @Test("When correct token is given, default color is applied to result")
    func testStyle_CorrectToken_DefaultColor() {
        let testToken = RecitationResultToken(text: "Hola", correctness: .correct)
        let result = target.style(testToken)
        #expect(result.foregroundColor == .primary)
    }
    
    @Test("When incorrect token is given, default color is not applied to result")
    func testStyle_IncorrectToken_NonDefaultColor() {
        let testToken = RecitationResultToken(text: "Hola", correctness: .missed)
        let result = target.style(testToken)
        #expect(result.foregroundColor != .primary)
    }
}
