//
//  Screen.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

enum Screen {
    case capture
    case challenge([Token])
    case result(RecitationResult)
}

extension Screen {
    var previewRouters: RoutingActions {
        switch self {
        case .capture:
            return RoutingActions(
                showChallenge: { text in
                    print("Preview: Capture -> Challenge with text: \(text.reduce("") { $0 + "\($1) " })")
                }
            )
        case .challenge:
            return RoutingActions(
                showResult: { result in
                    print("Preview: Challenge → Result")
                    print("Showing Results:")
                    let tokensGroupedByCorrectness: [RecitationResultCorrectness: [RecitationResultToken]] = Dictionary(grouping: result.results) { result in
                        switch result.correctness {
                        case .correct: return .correct
                        case .incorrect: return .incorrect
                        case .neutral: return .neutral
                        }
                    }
                    print("Correct Tokens: \(tokensGroupedByCorrectness[.correct] ?? [])")
                    print("Incorrect Tokens: \(tokensGroupedByCorrectness[.incorrect] ?? [])")
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
