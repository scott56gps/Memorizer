//
//  InputSelectView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/21/26.
//

import SwiftUI

struct InputSelectView: View {
    @State private var inputMethod: InputMethod = .Speech
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
            Button("Continue", action: { })
        }
        .padding()
    }
}

#Preview {
    InputSelectView()
}

enum InputMethod {
    case Text
    case Speech
}
