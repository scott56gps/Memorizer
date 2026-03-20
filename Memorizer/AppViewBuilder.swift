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
    static func build(screen: Screen, router: Router) -> some View {
        switch screen {
        case .capture: CaptureView(router: router)
        case .challenge(let memorizationText): ChallengeView(router: router, viewModel: ChallengeViewModel(memorizedText: memorizationText))
        case .result(let missedMemorizedText): ResultView(router: router, missedMemorizedText: missedMemorizedText)
        }
    }
    
    @ViewBuilder
    static func buildPreview(screen: Screen) -> some View {
        switch screen {
        case .capture: CaptureView(router: Router())
        case .challenge(let memorizationText): ChallengeView(router: Router(), viewModel: ChallengeViewModel(memorizedText: memorizationText))
        case .result(let missedMemorizedText): ResultView(router: Router(), missedMemorizedText: missedMemorizedText)
        }
    }
}
