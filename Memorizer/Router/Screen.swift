//
//  Screen.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/20/26.
//

enum Screen {
    case capture
    case challenge(String)
    case result((String, [Substring])?)
}

extension Screen {
    var previewRouters: RoutingActions {
        switch self {
        case .capture:
            return RoutingActions(
                showChallenge: { text in
                    print("Preview: Capture -> Challenge with text: \(text)")
                }
            )
        case .challenge:
            return RoutingActions(
                showResult: { result in
                    print("Preview: Challenge → Result")
                    if let result {
                        print("Preview: with starting text: \(result.0)")
                        print("Preview: And missing words:")
                        result.1.forEach { word in
                            print(word)
                        }
                    }
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
