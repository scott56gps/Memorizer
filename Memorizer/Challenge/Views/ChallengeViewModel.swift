//
//  ChallengeViewModel.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

struct ChallengeViewModel {
    var memorizedTokens: [Token]

    func getResultsFor(attemptedText: String) -> RecitationResult {
        let attemptedWords = DefaultTokenizer().tokenize(attemptedText)
            .filter { $0.isWord }
            .map { $0.text }
        let results = DefaultScorer().score(memorizedTokens: memorizedTokens, attemptedWords: attemptedWords)
        return RecitationResult(results: results)
    }
}
