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
    func score(string: String) -> RecitationResult {
        return RecitationResult(results: [RecitationResultToken(text: "Nope", correctness: .incorrect)])
    }
}
