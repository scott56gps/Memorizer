//
//  ChallengeView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ChallengeView: View {
    var navigators: RoutingActions
    @State var inputText: String = ""
    let challenge: RecitationChallenge
    
    let tokenizer: Tokenizing
    let scorer: Scoring
    
    let inputMethod: InputMethod

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            Text("Please recite your text:")
            switch inputMethod {
            case .Text:
                TextField("", text: $inputText)
                    .border(.blue)
            case .Speech:
                Text(inputText)
                    .border(.blue)
                Button(action: {
                    inputText = "Speech input"
                }) {
                    Text("Record")
                }
            }

            Spacer()
            Button("Check Result!") {
                let results = challenge.score(attemptedString: inputText, tokenizer: tokenizer, scorer: scorer)
                navigators.showResult(results)
            }
            .disabled(inputText.isEmpty)
        }
        .padding()
    }
}

#Preview {
    let tokens = DefaultTokenizer().tokenize("My Bonnie Flies over the ocean")
    AppViewBuilder.buildPreview(screen: .challenge(
        RecitationChallenge(memorizedTokens: tokens),
        .Speech)
    )
}
