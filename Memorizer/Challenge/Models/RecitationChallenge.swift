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
        let memorizedWords = memorizedTokens.compactMap(extractWordToken)
        let attemptedWords = tokenizer.tokenize(attemptedString)
            .compactMap(extractWordToken)
        
        let results = scorer.score(memorizedWords: memorizedWords, attemptedWords: attemptedWords)
        var resultIterator = results.makeIterator()
        
        // Convert our memorizedTokens into results
        let recitationResults = memorizedTokens.map { token in
            switch token {
            case .word(let text):
                let correctness = resultIterator.next() ?? .missed
                return RecitationResultToken(text: text, correctness: correctness)
            case .punctuation(let text):
                return RecitationResultToken(text: text, correctness: .unscored)
            }
        }
        return RecitationResult(results: recitationResults)
    }
    
    private func extractWordToken(_ token: Token) -> String? {
        if case .word(let attemptedWord) = token { return attemptedWord }
        else { return nil }
    }
}

extension RecitationChallenge {
    static func mock(withText text: String, tokenizer: Tokenizing) -> RecitationChallenge {
        self.init(memorizedTokens: tokenizer.tokenize(text))
    }
}
