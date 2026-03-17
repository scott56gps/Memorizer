//
//  ChallengeView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ChallengeView: View {
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
                // TODO: Check Text
                // TODO: Navigate to ResultView
                viewModel.verifyText(text: inputText)
            }
            .disabled(inputText.isEmpty)
        }
        .padding()
    }
}

#Preview {
    ChallengeView(viewModel: ChallengeViewModel(memorizationText: "My Bonnie Flies over the ocean"))
}
