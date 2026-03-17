//
//  ChallengeViewModel.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

struct ChallengeViewModel {
    let memorizationText: String
    
    func verifyText(text: String) -> [Substring] {
        let lowercasedText = text.lowercased()
        return memorizationText.lowercased().split(separator: " ").filter { !text.contains(String($0)) }
    }
}
