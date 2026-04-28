//
//  LCSAlgorithmTests.swift
//  MemorizerTests
//
//  Created by Scott Nicholes on 4/28/26.
//

import Testing
@testable import Memorizer

struct LCSAlgorithmTests {
    let lcs = LCSAlgorithm()
    
    @Test("Empty arrays return an empty result")
    func emptyArraysReturnsEmptyResult() {
        let leftArray: [String] = []
        let rightArray: [String] = []
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.isEmpty)
    }
    
    @Test("An empty left array returns an empty result.")
    func emptyLeftArrayReturnsEmptyResult() {
        let rightArray = ["hello", "bob"]
        let result = lcs.lcsMatches([], rightArray, matches: ==)
        #expect(result.isEmpty)
    }
    
    @Test("An empty right array returns an empty result.")
    func emptyRightArrayReturnsEmptyResult() {
        let leftArray = ["hello", "bob"]
        let result = lcs.lcsMatches(leftArray, [], matches: ==)
        #expect(result.isEmpty)
    }
    
    @Test("Single element arrays that match have a single result with matching indices")
    func singleMatchingElementReturnsMatchingIndex() {
        let leftArray = ["hello"]
        let rightArray = ["hello"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.count == 1)
        #expect(result.elementsEqual([(0,0)], by: ==))
    }
    
    @Test("Single element arrays that do not match have an empty result")
    func singleNonMatchingElementReturnsEmptyResult() {
        let leftArray = ["hello"]
        let rightArray = ["bob"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.isEmpty)
    }
    
    @Test("Multiple element matching arrays return matching indices")
    func matchingArraysReturnMatchingIndices() {
        let leftArray = ["hello", "bob"]
        let rightArray = ["hello", "bob"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.elementsEqual([(0,0), (1,1)], by: ==))
    }
    
    @Test("Arrays with no common elements return an empty result")
    func arraysWithNoCommonElementsReturnEmptyResult() {
        let leftArray = ["hello", "bob"]
        let rightArray = ["how", "are", "you"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.isEmpty)
    }
    
    @Test("A non empty left array and a matching prefix return the indices of that prefix.")
    func matchingPrefixReturnsPrefixIndices() {
        let leftArray  = ["hello", "bob"]
        let rightArray = ["hello"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.elementsEqual([(0,0)], by: ==))
    }
    
    @Test("Repeated words match the later instance when the suffix aligns")
    func repeatedWordsMatchTheLaterInstanceWhenTheSuffixAligns() {
        let leftArray  = ["hello", "bob", "hello"]
        let rightArray          = ["bob", "hello"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.elementsEqual([(1,0), (2,1)], by: ==))
    }
    
    @Test("Elements matched out of order on the left are skipped in favor of the longest sequence")
    func interleavedMissesAreSkipped() {
        let leftArray  = ["hello", "bob", "how", "are", "you"]
        let rightArray = ["bob", "are"]
        let result = lcs.lcsMatches(leftArray, rightArray, matches: ==)
        #expect(result.elementsEqual([(1,0), (3,1)], by: ==))
    }
}
