//
//  LCSScorer.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/24/26.
//

struct LCSScorer: Scoring {
    func score(memorizedWords: [String], attemptedWords: [String]) -> [RecallResult] {
        var lcsOutput = lcsMatches(memorizedWords, attemptedWords, matches: ==)
        
        let results: [RecallResult] = (0...memorizedWords.count).map { i in
            var result: RecallResult = .missed
            if let lastOutput = lcsOutput.last?.0 {
                if i == lastOutput {
                    result = .correct
                    lcsOutput = lcsOutput.dropLast(1)
                }
                result = i == lastOutput ? .correct : .missed
            }
            return result
        }
        return results
    }
}

func lcsMatches<L, R>(_ left: [L], _ right: [R], matches: (L, R) -> Bool) -> [(Int, Int)] {
    let n = left.count
    let m = right.count
    
    guard n > 0, m > 0 else { return [] }
    
    // 1. Construct a matrix of size n+1 by m+1
    //  with the first row and column filled with 0s
    var lengths = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
    // Fill in the matrix
    for i in 1...n {
        for j in 1...m {
            let upLength       = lengths[i - 1][j]
            let leftLength     = lengths[i][j - 1]
            let diagonalLength = lengths[i - 1][j - 1] + 1
                        
            // Prefer a match only when the diagonal improves on skipping both the left and up elements
            lengths[i][j] = matches(left[i - 1], right[j - 1]) && diagonalLength > max(upLength, leftLength)
            ? diagonalLength
            : max(upLength, leftLength)
        }
    }
    
    // Traceback: mirror the fill rules to recover the match positions
    // At each cell, prefer a match if one exists AND it strictly beats skipping both the left and up elements
    var i = n
    var j = m
    var matchingPairs: [(Int, Int)] = []
    
    while i > 0 && j > 0 {
        let upLength       = lengths[i - 1][j]
        let leftLength     = lengths[i][j - 1]
        let diagonalLength = lengths[i - 1][j - 1] + 1

        if matches(left[i - 1], right[j - 1]) && diagonalLength > max(upLength, leftLength) {
            matchingPairs.append((i - 1, j - 1))
            i -= 1
            j -= 1
        } else if upLength >= leftLength {
            i -= 1
        } else {
            j -= 1
        }
    }
    
    matchingPairs.reverse()
    return matchingPairs
}
