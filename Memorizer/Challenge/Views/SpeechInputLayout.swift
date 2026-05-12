//
//  SpeechInputView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//

import SwiftUI

struct SpeechInputLayout: View {
    @StateObject var viewModel = SpeechInputViewModel(transcriber: SpeechTranscriber())
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(viewModel.text)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .border(.foreground)

            Button(action: {
                if !viewModel.isListening {
                    viewModel.startTranscription()
                } else {
                    viewModel.stopTranscription()
                    text = viewModel.text
                }
            }) {
                if viewModel.isListening {
                    Text("Stop Listening")
                } else {
                    Text("Start Listening")
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var text = ""
    SpeechInputLayout(text: $text)
}
