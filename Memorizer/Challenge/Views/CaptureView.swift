//
//  ContentView.swift
//  ScriptureMemorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct CaptureView: View {
    @State var text: String = ""
    
    var navigators: RoutingActions
    let tokenizer: Tokenizing

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            Text("Please input text you want to memorize:")
            TextField("", text: $text)
                .border(.blue)
            Spacer()
            Button("Start Memorizing!") {
                // We're tokenizing the text here, but really, we should be saving the text entered.
                //  Tokenization should occur only when we're about to start a challenge.
                let tokenizedText = tokenizer.tokenize(text)
                
                // This is simulating coming from a "MenuView" or something like that.
                // The tokenized text should only be created from the MenuView, since that View will be
                //  "kicking off the challenge"
                navigators.showChallenge(RecitationChallenge(memorizedTokens: tokenizedText),
                                         // MARK: Remove after design spike
                                         InputMethod.Text)
            }
            .disabled(text.isEmpty)
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .capture)
}
