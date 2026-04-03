//
//  ScorerTests.swift
//  MemorizerTests
//
//  Created by Scott Nicholes on 4/1/26.
//

import Testing
@testable import Memorizer

struct ScorerTests {

    @Test("The count of scored words should be equal to the count of provided memorized words")
    func score_MemorizedCountAndResultCountEqual() {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let memorizedWords: [String] = ["Hello", "Code", "World"]
        let result = Scorer().score(memorizedWords: memorizedWords, attemptedWords: [])
        #expect(memorizedWords.count == result.count)
    }

    @Test("An attempted word should be scored as correct regardless of capitalization")
    func score_CapitalizationShouldNotAffectCorrectness() {
        let memorizedWords: [String] = ["Hello"]
        let attemptedWords: [String] = ["HELLO"]
        let result = Scorer().score(memorizedWords: memorizedWords, attemptedWords: attemptedWords)
        #expect(result[0].1 == true)
    }
    
    @Test("If Attempted Words are empty, all results should be false")
    func score_NoAttemptedWords_AllResultsFalse() {
        let memorizedWords: [String] = ["Hello", "Code", "World"]
        let attemptedWords: [String] = []
        let result = Scorer().score(memorizedWords: memorizedWords, attemptedWords: attemptedWords)
        result.forEach {
            #expect($0.1 == false)
        }
    }
    
    @Test("A memorized word with an incorrect attempted word should have a score of incorrect")
    func score_OneIncorrectAttempt_OneIncorrectResult() {
        let memorizedWords: [String] = ["Hello", "Code"]
        let attemptedWords: [String] = ["Hello", "Hola"]
        let result = Scorer().score(memorizedWords: memorizedWords, attemptedWords: attemptedWords)
        #expect(result[1].1 == false)
    }
}
