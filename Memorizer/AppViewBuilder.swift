//
//  MemorizerViewBuilder.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//
import SwiftUI

// This Builder will determine *how* to build views.
struct AppViewBuilder {
    // All this function needs is direction of *what* to build (Screen) and the global materials to build it (Router)
    @ViewBuilder
    static func build(screen: Screen, router: RoutingActions, tokenizer: Tokenizing, scorer: Scoring) -> some View {
        switch screen {
        case .capture: CaptureView(
            navigators: router,
            tokenizer: tokenizer
        )
        case .inputSelect: InputSelectView(
            navigators: router
        )
        case .challenge(let challenge, let inputMethod): ChallengeView(
            navigators: router,
            challenge: challenge,
            tokenizer: tokenizer,
            scorer: scorer,
            inputMethod: inputMethod
        )
        case .result(let results): ResultView(
            navigators: router,
            results: results
        )
        }
    }
    
    @ViewBuilder
    static func buildPreview(screen: Screen) -> some View {
        build(
            screen: screen,
            router: screen.previewRouters,
            tokenizer: DefaultTokenizer(),
            scorer: LCSScorer())
    }
}
