//
//  ChallengeView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ChallengeView: View {
    let memorizationText: String
    @State var inputText: String = ""
    
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
            }
            .disabled(inputText.isEmpty)
        }
        .padding()
    }
}

#Preview {
    ChallengeView(memorizationText: "My bonnie flies over the ocean")
}
