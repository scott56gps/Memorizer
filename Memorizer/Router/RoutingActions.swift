//
//  RoutingActions.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

struct RoutingActions {
    var showCapture: () -> Void = { }
    var showChallenge: (String) -> Void = { _ in }
    var showResult: ((String, [Substring])) -> Void = { _ in }
}
