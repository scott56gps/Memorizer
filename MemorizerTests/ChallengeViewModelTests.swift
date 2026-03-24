//
//  ScriptureMemorizerTests.swift
//  ScriptureMemorizerTests
//
//  Created by Scott Nicholes on 3/16/26.
//

import Testing
@testable import Memorizer

struct ChallengeViewModelTests {

    @Test("Strings with differing capitals but same words - empty result")
    func missedWordsFor_DifferentCapitals_EmptyResult() {
        let testMemorizedText = "My bonnie flies"
        let testTextToVerify = "my bonnie flies"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.missedWordsFor(text: testTextToVerify)
        #expect(result.isEmpty == true)
    }

    @Test("Strings with same capitals and same words - empty result")
    func missedWordsFor_NoCapitals_SameWords_EmptyResult() {
        let testMemorizedText = "my bonnie flies"
        let testTextToVerify = "my bonnie flies"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.missedWordsFor(text: testTextToVerify)
        #expect(result.isEmpty == true)
    }

    @Test("Strings with different punctuation but same words - empty result")
    func missedWordsFor_DifferentPunctuation_EmptyResult() {
        let testMemorizedText = "My bonnie flies"
        let testTextToVerify = "My, bonnie flies!"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.missedWordsFor(text: testTextToVerify)
        #expect(result.isEmpty == true)
    }

    @Test("Strings with same punctuation and same words - empty result")
    func missedWordsFor_SamePunctuation_EmptyResult() {
        let testMemorizedText = "My, bonnie flies!"
        let testTextToVerify = "My, bonnie flies!"
        let viewModel = ChallengeViewModel(memorizedText: testMemorizedText)
        let result = viewModel.missedWordsFor(text: testTextToVerify)
        #expect(result.isEmpty == true)
    }

}
