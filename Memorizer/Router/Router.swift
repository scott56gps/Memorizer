import SwiftUI
import Combine

final class Router: ObservableObject {
    // This is the single source of truth that defines what screen we are currently looking at
    @Published var currentView: Screen = .inputSelect
    
    lazy var navigators = RoutingActions(
        showCapture: { [weak self] in
            self?.currentView = .capture
        },
        showInputSelect: { [weak self] in
            self?.currentView = .inputSelect
        },
        showChallenge: { [weak self] challenge, inputMethod in
            self?.currentView = .challenge(challenge, inputMethod)
        },
        showResult: { [weak self] result in
            self?.currentView = .result(result)
        }
    )
}


