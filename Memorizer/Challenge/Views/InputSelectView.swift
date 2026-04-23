//
//  InputSelectView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/21/26.
//

import SwiftUI

struct InputSelectView: View {
    var navigators: RoutingActions
    @State private var inputMethod: InputMethod = .Speech
    
    let challenge = RecitationChallenge.mock(
        withText: """
        And what is it that ye shall hope for?  Behold, I say unto you that ye shall have hope \
        through the Atonement of christ and the power of his resurrection, to be raised unto \
        life eternal, and this because of your faith in him according to the promise.
        """,
        tokenizer: DefaultTokenizer())
    var body: some View {
        VStack{
            Spacer()
            Text("Alma 7:11")
            Spacer()
            Picker("Input Method", selection: $inputMethod) {
                Text("Text").tag(InputMethod.Text)
                Text("Speech").tag(InputMethod.Speech)
            }
            .pickerStyle(.segmented)
            Button("Continue", action: {
                navigators.showChallenge(challenge, inputMethod)
            })
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .inputSelect)
}

enum InputMethod {
    case Text
    case Speech
}
