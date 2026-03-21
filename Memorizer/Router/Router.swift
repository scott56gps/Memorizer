import SwiftUI
import Combine

final class Router: ObservableObject {
    // This is the single source of truth that defines what screen we are currently looking at
    @Published var currentView: Screen = .capture
    
    lazy var navigators = RoutingActions(
        showCapture: { [weak self] in
            self?.currentView = .capture
        },
        showChallenge: { [weak self] text in
            self?.currentView = .challenge(text)
        },
        showResult: { [weak self] result in
            self?.currentView = .result(result)
        }
    )
}


