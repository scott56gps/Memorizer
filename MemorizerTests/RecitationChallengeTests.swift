//
//  ScriptureMemorizerTests.swift
//  ScriptureMemorizerTests
//
//  Created by Scott Nicholes on 3/16/26.
//

import Testing
@testable import Memorizer

//struct RecitationChallengeTests {
//    let tokenizer = DefaultTokenizer()
//    let scorer = LCSScorer()
//    
//    let testMemorizedTokens = [
//        Token.word("Hello"),
//        Token.word(","),
//        Token.word("Dolly")
//    ]
//    @Test(
//        "Strings with same number of words - result has same number of elements as words in memorized text"
//    )
//    func score_ChallengeTokens_MatchCountOfResultTokens() {
//        let challenge = RecitationChallenge(memorizedTokens: testMemorizedTokens)
//        
//        let result = challenge.score(
//            attemptedString: "",
//            tokenizer: tokenizer,
//            scorer: scorer
//        )
//        
//        #expect(result.results.count == testMemorizedTokens.count)
//    }
//    
//    @Test(
//        "The result token text should match the memorized token text in order and content"
//    )
//    func score_ChallengeTokens_MatchOrderOfResultTokens() {
//        let challenge = RecitationChallenge(memorizedTokens: testMemorizedTokens)
//        
//        let result = challenge.score(
//            attemptedString: "",
//            tokenizer: tokenizer,
//            scorer: scorer
//        )
//        
//        // Because zip only goes through the shortest collection, assert that both collections are of the same length
//        #expect(result.results.count == testMemorizedTokens.count)
//        for (result, memorizedToken) in zip(result.results, testMemorizedTokens) {
//            #expect(result.text == memorizedToken.text)
//        }
//    }
//}
