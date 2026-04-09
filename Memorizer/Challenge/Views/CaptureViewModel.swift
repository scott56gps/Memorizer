//
//  CaptureViewModel.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/7/26.
//

struct CaptureViewModel {
    func tokenizeText(_ text: String) -> [Token] {
        Tokenizer.tokenize(text)
    }
}
