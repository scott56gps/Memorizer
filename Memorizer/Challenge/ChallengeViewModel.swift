//
//  ChallengeViewModel.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//
import Tokenizer

struct ChallengeViewModel {
    let memorizedText: String

    func verifyText(text: String) -> Bool {
        let tokenizedText = Tokenizer.tokenize(text.lowercased())
        let tokenizedMemorizedText = Tokenizer.tokenize(memorizedText.lowercased())
        return tokenizedText == tokenizedMemorizedText
    }
}
