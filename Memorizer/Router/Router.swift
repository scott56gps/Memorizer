import SwiftUI
import Combine

final class Router: ObservableObject, RouteModifiable {
    // This is the piece of state that defines what screen we are currently looking at
    @Published var currentView: Screen = .capture

    func showCapture() {
        currentView = .capture
    }

    func showChallenge(memorizedText: String) {
        currentView = .challenge(memorizedText)
    }

    func showResult(missingWordsResult: (String, [Substring])?) {
        currentView = .result(missingWordsResult)
    }
}

extension Router {
    static func simulateShowCapture() {
        print("Showing CaptureView")
    }
    
    static func simulateShowChallenge(memorizedText: String) {
        print("Showing ChallengeView with text:\(memorizedText)")
    }
    
    static func simulateShowResult(missingWordsResult: (String, [Substring])?) {
        print("Showing ResultView")
        if let missingWordsResult {
            print("With original text: \(missingWordsResult.0)")
            print("With missingWords:")
            missingWordsResult.1.forEach { word in
                print(word)
            }
        }
    }
}

protocol RouteModifiable {
    func showCapture()
    func showChallenge(memorizedText: String)
    func showResult(missingWordsResult: (String, [Substring])?)
}

enum Screen {
    case capture
    case challenge(String)
    case result((String, [Substring])?)
}
