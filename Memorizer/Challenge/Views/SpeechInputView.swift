//
//  SpeechInputView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//

import SwiftUI

struct SpeechInputView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .border(.blue)
            Button(action: {
                text = "Speech input"
            }) {
                Text("Record")
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    SpeechInputView(text: $text)
}
