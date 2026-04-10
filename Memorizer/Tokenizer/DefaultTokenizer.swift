//
//  TextTokenizer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/3/26.
//
import Foundation

struct DefaultTokenizer: Tokenizing {
    private let regex = try! Regex<Substring>(#"[\w']+|[[:punct:]]\s*|\s+"#)
    
    func tokenize(_ string: String) -> [Token] {
        string.matches(of: regex).map { match in
            let text = String(match.output)

            let isWord = text.range(
                of: #"[\w']+"#,
                options: .regularExpression
            ) != nil

            return Token(text: text, isWord: isWord)
        }
    }
}
