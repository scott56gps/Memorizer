//
//  ScriptureMemorizerTests.swift
//  ScriptureMemorizerTests
//
//  Created by Scott Nicholes on 3/16/26.
//

import Testing
@testable import Memorizer

struct ChallengeViewModelTests {

    @Test("Strings with differing capitals but same words - should verify")
    func verifyString_Capitals_Different_Should_Verify() {
        let testMemorizedText = "My bonnie flies"
        let testTextToVerify = "my bonnie flies"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.verifyText(text: testTextToVerify)
        #expect(result == true)
    }

    @Test("Strings with same capitals but same words - should verify")
    func verifyString_NoCapitals_Should_Verify() {
        let testMemorizedText = "my bonnie flies"
        let testTextToVerify = "my bonnie flies"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.verifyText(text: testTextToVerify)
        #expect(result == true)
    }
    
    @Test("Strings with different punctuation but same words - should verify")
    func verifyString_Punctuation_Different_Should_Verify() {
        let testMemorizedText = "My bonnie flies"
        let testTextToVerify = "My, bonnie flies!"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.verifyText(text: testTextToVerify)
        #expect(result == true)
    }
    
    @Test("Strings with same punctuation but same words - should verify")
    func verifyString_Punctuation_Same_Should_Verify() {
        let testMemorizedText = "My, bonnie flies!"
        let testTextToVerify = "My, bonnie flies!"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.verifyText(text: testTextToVerify)
        #expect(result == true)
    }

}
