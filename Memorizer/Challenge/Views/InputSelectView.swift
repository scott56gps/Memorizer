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
        withText: "Look unto me in every thought; doubt not, fear not.",
        tokenizer: DefaultTokenizer())
    var body: some View {
        VStack{
            Spacer()
            Text("D&C 6:36")
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
