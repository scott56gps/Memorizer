//
//  Scoring.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/10/26.
//

protocol Scoring {
    func score(memorizedWords: [String], attemptedWords: [String]) -> [RecallResult]
}
