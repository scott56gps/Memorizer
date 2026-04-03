//
//  Scorer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/1/26.
//

struct Scorer {
    func score(memorizedWords: [String], attemptedWords: [String]) -> [(String, Bool)] {
        let result = score(memorizedWords: memorizedWords[...], attemptedWords: attemptedWords[...]) {
            $0.lowercased() == $1.lowercased()
        }
        return result
    }
    
    private func score(memorizedWords: ArraySlice<String>,
                       attemptedWords: ArraySlice<String>,
                       itemPredicate: (String, String) -> Bool) -> [(String, Bool)] {
        guard let firstOriginal = memorizedWords.first else { return [] }

        if let firstAttempted = attemptedWords.first, itemPredicate(firstAttempted, firstOriginal) {
            return [(firstOriginal, true)] +
            score(
                memorizedWords: memorizedWords.dropFirst(),
                attemptedWords: attemptedWords.dropFirst(),
                itemPredicate: itemPredicate
            )
        } else {
            return [(firstOriginal, false)] +
            score(
                memorizedWords: memorizedWords.dropFirst(),
                attemptedWords: attemptedWords,
                itemPredicate: itemPredicate
            )
        }
    }
}
