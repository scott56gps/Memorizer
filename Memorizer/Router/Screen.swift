//
//  Screen.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

enum Screen {
    case capture
    case inputSelect
    case challenge(RecitationChallenge, InputMethod)
    case result(RecitationResult)
}

extension Screen {
    var previewRouters: RoutingActions {
        switch self {
        case .capture:
            return RoutingActions(
                showChallenge: { challenge, inputMethod in
                    print("Preview: Capture -> Challenge with tokens: \(challenge.memorizedTokens)")
                    print("and input method: \(inputMethod)")
                }
            )
        case .inputSelect:
            return RoutingActions(
                showChallenge: { challenge, inputMethod in
                    print("Preview: InputSelect -> Challenge with tokens: \(challenge.memorizedTokens)")
                    print("and input method: \(inputMethod)")
                }
            )
        case .challenge:
            return RoutingActions(
                showResult: { result in
                    print("Preview: Challenge → Result")
                    print("Showing Results:")
                    let tokensGroupedByCorrectness: [RecallResult: [RecitationResultToken]] = Dictionary(grouping: result.results) { result in
                        switch result.correctness {
                        case .correct: return .correct
                        case .missed: return .missed
                        case .unscored: return .unscored
                        }
                    }
                    print("Correct Tokens: \(tokensGroupedByCorrectness[.correct] ?? [])")
                    print("Missed Tokens: \(tokensGroupedByCorrectness[.missed] ?? [])")
                    print("Full String: \(result.results.reduce("") { $0 + $1.text })")
                }
            )
        case .result:
            return RoutingActions(
                showCapture: {
                    print("Preview: Result → Capture")
                }
            )
        }
    }
}
