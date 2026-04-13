//
//  ContentView.swift
//  ScriptureMemorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct CaptureView: View {
    var navigators: RoutingActions
    @State var text: String = ""
    var viewModel: CaptureViewModel

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
                let tokenizedText = viewModel.tokenizeText(text)
                
                // This is simulating coming from a "MenuView" or something like that.
                // The tokenized text should only be created from the MenuView, since that View will be
                //  "kicking off the challenge"
                navigators.showChallenge(RecitationChallenge(memorizedTokens: tokenizedText))
            }
            .disabled(text.isEmpty)
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .capture)
}
