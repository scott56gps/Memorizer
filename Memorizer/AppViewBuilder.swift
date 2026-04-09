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
    static func build(screen: Screen, router: RoutingActions) -> some View {
        switch screen {
        case .capture: CaptureView(navigators: router, viewModel: CaptureViewModel())
        case .challenge(let memorizedTokens): ChallengeView(navigators: router, viewModel: ChallengeViewModel(memorizedTokens: memorizedTokens))
        case .result(let results): ResultView(navigators: router, results: results)
        }
    }
    
    @ViewBuilder
    static func buildPreview(screen: Screen) -> some View {
        build(
            screen: screen,
            router: screen.previewRouters)
    }
}
