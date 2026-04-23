//
//  RoutingActions.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

struct RoutingActions {
    var showCapture: () -> Void = { }
    var showInputSelect: () -> Void = { }
    var showChallenge: (RecitationChallenge, InputMethod) -> Void = { _, _ in }
    var showResult: (RecitationResult) -> Void = { _ in }
}
