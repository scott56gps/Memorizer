//
//  RoutingActions.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

struct RoutingActions {
    var showCapture: () -> Void = { }
    var showChallenge: (RecitationChallenge) -> Void = { _ in }
    var showResult: (RecitationResult) -> Void = { _ in }
}
