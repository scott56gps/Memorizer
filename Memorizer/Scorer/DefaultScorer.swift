//
//  Scorer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/1/26.
//

struct DefaultScorer: Scoring {
    func score(memorizedTokens: [Token], attemptedWords: [String]) -> [RecitationResultToken] {
        let result = score(memorizedTokens: memorizedTokens[...], attemptedWords: attemptedWords[...]) {
            $0.lowercased() == $1.lowercased()
        }
        return result
    }
    
    private func score(memorizedTokens: ArraySlice<Token>,
                       attemptedWords: ArraySlice<String>,
                       itemPredicate: (String, String) -> Bool) -> [RecitationResultToken] {
        guard let firstOriginal = memorizedTokens.first else { return [] }
        if !firstOriginal.isWord { return [RecitationResultToken(text: firstOriginal.text, correctness: .neutral)] + score(
            memorizedTokens: memorizedTokens.dropFirst(),
            attemptedWords: attemptedWords,
            itemPredicate: itemPredicate) }

        if let firstAttempted = attemptedWords.first, itemPredicate(firstAttempted, firstOriginal.text) {
            return [RecitationResultToken(text: firstOriginal.text, correctness: .correct)] +
            score(
                memorizedTokens: memorizedTokens.dropFirst(),
                attemptedWords: attemptedWords.dropFirst(),
                itemPredicate: itemPredicate
            )
        } else {
            return [RecitationResultToken(text: firstOriginal.text, correctness: .incorrect)] +
            score(
                memorizedTokens: memorizedTokens.dropFirst(),
                attemptedWords: attemptedWords,
                itemPredicate: itemPredicate
            )
        }
    }
}
