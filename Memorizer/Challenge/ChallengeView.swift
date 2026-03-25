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
    var viewModel: ChallengeViewModel

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            Text("Please recite your text:")
            TextField("", text: $inputText)
                .border(.blue)
            Spacer()
            Button("Check Result!") {
                let missedWords = viewModel.missedWordsFor(text: inputText)
                navigators.showResult((viewModel.memorizedText, missedWords))
            }
            .disabled(inputText.isEmpty)
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .challenge("My Bonnie Flies over the ocean"))
}
