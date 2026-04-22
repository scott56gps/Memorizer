//
//  Scorer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/1/26.
//

struct DefaultScorer: Scoring {
    func score(memorizedTokens: [Token], attemptedWords: [String]) -> [RecitationResultToken] {
        let result = score(
            memorizedTokens: memorizedTokens[...],
            attemptedWords: attemptedWords[...]
        ) {
            $0.lowercased() == $1.lowercased()
        }
        return result
    }
    
    private func score(memorizedTokens: ArraySlice<Token>,
                       attemptedWords: ArraySlice<String>,
                       itemPredicate: (String, String) -> Bool) -> [RecitationResultToken] {
        guard let firstOriginal = memorizedTokens.first else { return [] }
        if !firstOriginal.isWord {
            return [RecitationResultToken(text: firstOriginal.text, correctness: .neutral)] +
            score(
                memorizedTokens: memorizedTokens.dropFirst(),
                attemptedWords: attemptedWords,
                itemPredicate: itemPredicate)
        }

        if let firstAttempted = attemptedWords.first {
            // We have an attempted word to test
            if itemPredicate(firstAttempted, firstOriginal.text) {
                // They match
                return [RecitationResultToken(text: firstOriginal.text, correctness: .correct)] +
                score(
                    memorizedTokens: memorizedTokens.dropFirst(),
                    attemptedWords: attemptedWords.dropFirst(),
                    itemPredicate: itemPredicate
                )
            } else {
                // They do not match
                if attemptedWords.count > memorizedTokens.count {
                    // Don't mark as incorrect yet.  Look for a correct word by recurring
                    return score(
                        memorizedTokens: memorizedTokens,
                        attemptedWords: attemptedWords.dropFirst(),
                        itemPredicate: itemPredicate
                    )
                } else {
                    if attemptedWords.count == memorizedTokens.count {
                        // Put 'em both down
                        return [RecitationResultToken(text: firstOriginal.text, correctness: .incorrect)] +
                        score(
                            memorizedTokens: memorizedTokens.dropFirst(),
                            attemptedWords: attemptedWords.dropFirst(),
                            itemPredicate: itemPredicate
                        )
                    } else {
                        // Bring the memorized words down until they are equal
                        return [RecitationResultToken(text: firstOriginal.text, correctness: .incorrect)] +
                        score(
                            memorizedTokens: memorizedTokens.dropFirst(),
                            attemptedWords: attemptedWords,
                            itemPredicate: itemPredicate
                        )
                    }
                }
            }
        } else {
            // We do not have a word to match
            return [RecitationResultToken(text: firstOriginal.text, correctness: .incorrect)] +
            score(
                memorizedTokens: memorizedTokens.dropFirst(),
                attemptedWords: attemptedWords,
                itemPredicate: itemPredicate
            )
        }
    }
}
