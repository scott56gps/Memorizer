//
//  RecitationChallenge.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/10/26.
//

struct RecitationChallenge {
    let memorizedTokens: [Token]
}

extension RecitationChallenge {
    func score(attemptedString: String, tokenizer: Tokenizing, scorer: Scoring) -> RecitationResult {
        let attemptedWords = tokenizer.tokenize(attemptedString)
            .filter { $0.isWord }
            .map { $0.text }
            
        let results = scorer.score(memorizedTokens: memorizedTokens, attemptedWords: attemptedWords)
        return RecitationResult(results: results)
    }
}
