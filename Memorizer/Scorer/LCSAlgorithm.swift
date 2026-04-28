//
//  LCSAlgorithm.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/28/26.
//

/// Finds the indices of the Longest Common Subsequence among the given 2 arrays.
/// The Longest Common Subsequence is the longest sequence of elements that are common among collections,
/// not necessarily consecutive in order.
///
/// The output indices are 0-based, and the left coordinate corresponds with the left array, the right coordinate with
/// the right.
///
/// For example, given arrays:
/// left: [1, 2, 4, 6, 4, 8, 9 ]
/// right: [2, 4, 6, 8 ]
///
/// And the predicate: Equality (==)
///
/// The output would be:
/// [(1, 0), (2, 1), (3, 2), (5, 3)]
struct LCSAlgorithm {
    func lcsMatches<L, R>(_ left: [L], _ right: [R], matches: (L, R) -> Bool) -> [(Int, Int)] {
        let n = left.count
        let m = right.count
    
        guard n > 0, m > 0 else { return [] }
    
        // 1. Construct a matrix of size n+1 by m+1
        //  with the first row and column filled with 0s
        var lengths = Array(
            repeating: Array(repeating: 0, count: m + 1),
            count: n + 1
        )
    
        // Fill in the matrix
        for i in 1...n {
            for j in 1...m {
                let upLength       = lengths[i - 1][j]
                let leftLength     = lengths[i][j - 1]
                let diagonalLength = lengths[i - 1][j - 1] + 1
                        
                // Prefer a match only when the diagonal improves on skipping both the left and up elements
                lengths[i][j] = matches(left[i - 1], right[j - 1]) && diagonalLength > max(
                    upLength,
                    leftLength
                )
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

            if matches(left[i - 1], right[j - 1]) && diagonalLength > max(
                upLength,
                leftLength
            ) {
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
}
