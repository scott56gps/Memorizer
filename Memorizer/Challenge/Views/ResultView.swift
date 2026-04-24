//
//  ResultView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ResultView: View {
    var navigators: RoutingActions
    let results: RecitationResult
    var hasMissedText: Bool {
        results.hasMissedToken
    }

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            if hasMissedText {
                Text("Almost!")
                    .font(.title)
            } else {
                Text("Congratulations!")
                    .font(.title)
                Text("You correctly recited your text")
            }
            Text(results.resultText)
            Spacer()
            Button(hasMissedText ? "Try Again" : "Play Again") {
                navigators.showCapture()
            }
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .result(RecitationResult(results: [
        RecitationResultToken(text: "How", correctness: .correct),
        RecitationResultToken(text: "great", correctness: .missed),
        RecitationResultToken(text: ", ", correctness: .unscored),
        RecitationResultToken(text: "Thou", correctness: .correct),
        RecitationResultToken(text: "art", correctness: .correct)
    ])))
}
