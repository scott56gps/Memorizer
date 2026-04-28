//
//  LCSScorer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/24/26.
//

struct LCSScorer: Scoring {
    let lcsAlgorithm = LCSAlgorithm()
    
    func score(memorizedWords: [String], attemptedWords: [String]) -> [RecallResult] {
        let matchedIndices = lcsAlgorithm.lcsMatches(memorizedWords, attemptedWords) {
            $0.lowercased() == $1.lowercased()
        }
        
        var matchedIndicesIterator = matchedIndices.makeIterator()
        var nextMatch = matchedIndicesIterator.next()
        let results: [RecallResult] = (0..<memorizedWords.count).map { memorizedWordIndex in
            if let match = nextMatch, match.0 == memorizedWordIndex {
                nextMatch = matchedIndicesIterator.next()
                return .correct
            } else {
                return .missed
            }
        }
        return results
    }
}

