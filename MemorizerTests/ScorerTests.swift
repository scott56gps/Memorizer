//
//  ScorerTests.swift
//  MemorizerTests
//
//  Created by Scott Nicholes on 4/1/26.
//

import Testing
@testable import Memorizer

struct ScorerTests {

    @Test(
        "The count of scored words should be equal to the count of provided memorized words"
    )
    func score_MemorizedCountAndResultCountEqual() {
        let memorizedWords = ["Hello", "Code", "World"]
        let attemptedWords = ["Hello"]
        let results = LCSScorer().score(
            memorizedWords: memorizedWords,
            attemptedWords: attemptedWords
        )
        #expect(memorizedWords.count == results.count)
    }

//    @Test(
//        "An attempted word should be scored as correct regardless of capitalization"
//    )
//    func score_CapitalizationShouldNotAffectCorrectness() {
//        let memorizedTokens: [Token] = [Token(text: "Hello", isWord: true)]
//        let attemptedWords: [String] = ["HELLO"]
//        let result = DefaultScorer().score(
//            memorizedTokens: memorizedTokens,
//            attemptedWords: attemptedWords
//        )
//        #expect(result[0].correctness == .correct)
//    }
//    
//    @Test("If Attempted Words are empty, all results should be incorrect")
//    func score_NoAttemptedWords_AllResultsFalse() {
//        let memorizedTokens: [Token] = [
//            Token(text: "Hello", isWord: true),
//            Token(text: "Code", isWord: true),
//            Token(text: "World", isWord: true)]
//        let attemptedWords: [String] = []
//        let result = DefaultScorer().score(
//            memorizedTokens: memorizedTokens,
//            attemptedWords: attemptedWords
//        )
//        result.forEach {
//            #expect($0.correctness == .incorrect)
//        }
//    }
//    
//    @Test(
//        "A memorized word with an incorrect attempted word should have a score of incorrect"
//    )
//    func score_OneIncorrectAttempt_OneIncorrectResult() {
//        let memorizedTokens: [Token] = [
//            Token(text: "Hello", isWord: true),
//            Token(text: "dolly", isWord: true)]
//        let attemptedWords: [String] = ["Hola", "dolly"]
//        let result = DefaultScorer().score(
//            memorizedTokens: memorizedTokens,
//            attemptedWords: attemptedWords
//        )
//        #expect(result[0].correctness == .incorrect)
//        #expect(result[1].correctness == .correct)
//    }
//    
//    @Test(
//        "If attempted words is shorter than memorized tokens, correct tokens should be marked as correct"
//    )
//    func score_FewerAttemptedWordsThanMemorized_CorrectTokensMarkedAsCorrect() {
//        let memorizedTokens: [Token] = [
//            Token(text: "Hello", isWord: true),
//            Token(text: "Code", isWord: true),
//            Token(text: "World", isWord: true)]
//        let attemptedWords: [String] = ["Hello", "Code"]
//        let result = DefaultScorer().score(
//            memorizedTokens: memorizedTokens,
//            attemptedWords: attemptedWords
//        )
//        #expect(result.map(\.correctness) == [.correct, .correct, .incorrect])
//    }
//    
//    @Test(
//        "If attempted words is shorter than memorized tokens and a correct attempted word comes after a memorized token, that word should be marked as correct"
//    )
//    func score_FewerAttemptedWordsThanMemorized_IncorrectWordFollowedByCorrectOneMarkedAsIncorrect() {
//        let memorizedTokens: [Token] = [
//            Token(text: "Hello", isWord: true),
//            Token(text: "Code", isWord: true),
//            Token(text: "World", isWord: true)]
//        let attemptedWords: [String] = ["Code"]
//        let result = DefaultScorer().score(
//            memorizedTokens: memorizedTokens,
//            attemptedWords: attemptedWords
//        )
//        #expect(result.map(\.correctness) == [.incorrect, .correct, .incorrect])
//    }
}
