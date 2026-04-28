//
//  ScorerTests.swift
//  MemorizerTests
//
//  Created by Scott Nicholes on 4/1/26.
//

import Testing
@testable import Memorizer

struct LCSScorerTests {

    @Test(
        "The count of scored words should be equal to the count of provided memorized words"
    )
    func score_MemorizedCountAndResultCountEqual() {
        let memorizedWords = ["Hello", "Code", "World"]
        let attemptedWords = ["Hello"]
        let results = LCSScorer().score(memorizedWords: memorizedWords, attemptedWords: attemptedWords)
        #expect(memorizedWords.count == results.count)
    }

    @Test("If Attempted Words are empty, all results should be missed")
    func score_NoAttemptedWords_AllResultsFalse() {
        let memorizedWords: [String] = [
            "Hello",
            "Code",
            "World",
        ]
        let attemptedWords: [String] = []
        let results = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(results.allSatisfy { $0 == .missed })
    }
    
    @Test(
        "An attempted word should be scored as correct regardless of capitalization"
    )
    func score_CapitalizationShouldNotAffectCorrectness() {
        let memorizedWords: [String] = ["Hello"]
        let attemptedWords: [String] = ["HELLO"]
        let result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.correct])
    }
    
    @Test(
        "A memorized word with an incorrect attempted word should have a score of incorrect"
    )
    func score_OneIncorrectAttempt_OneIncorrectResult() {
        let memorizedWords: [String] = ["Hello"]
        let attemptedWords: [String] = ["Hola"]
        let result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.missed])
    }
    
    @Test("If missed words are found among correct words, correct words should me marked as correct")
    func score_MissedWordsAmongCorrect_CorrectWordsStillCorrect() {
        let memorizedWords: [String] = ["Hello", "Code", "World"]
        let attemptedWords: [String] = ["Hello", "crude", "World"]
        let result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.correct, .missed, .correct])
    }
    
    @Test(
        "If attempted words is shorter than memorized words, correct words should be marked as correct"
    )
    func score_FewerAttemptedWordsThanMemorized_CorrectTokensMarkedAsCorrect() {
        let memorizedWords: [String] = [
            "Hello",
            "Code",
            "World"]
        let attemptedWords: [String] = ["Hello", "Code"]
        let result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.correct, .correct, .missed])
    }
    
    @Test(
        "If attempted words is shorter than memorized words and a correct attempted word comes after a memorized word, that word should be marked as correct"
    )
    func score_FewerAttemptedWordsThanMemorized_IncorrectWordFollowedByCorrectOneMarkedAsIncorrect() {
        let memorizedWords: [String] = [
            "Hello",
            "Code",
            "World"]
        let attemptedWords: [String] = ["Code"]
        let result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.missed, .correct, .missed])
    }
    
    @Test(
        "If a repeated word occurs in memorized words, but only one of them is attempted, the correct one is marked as correct"
    )
    func score_RepeatedWordInMemorizedButNotAttempted_CorrectTokenMarkedAsCorrect() {
        // First occurence should be correct
        let memorizedWords: [String] = ["Hello", "my", "baby", "hello", "my", "honey"]
        var attemptedWords: [String] = ["hello", "baby", "my"]
        var result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.correct, .missed, .correct, .missed, .correct, .missed])
        
        // Second occurence should be correct
        attemptedWords = ["my", "hello", "honey"]
        result = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(result == [.missed, .correct, .missed, .correct, .missed, .correct])
    }
}
