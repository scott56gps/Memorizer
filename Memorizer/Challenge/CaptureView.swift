//
//  ContentView.swift
//  ScriptureMemorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct CaptureView: View {
    @State var text: String = ""
    
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
                // TODO: Navigate to ChallengeView
            }
            .disabled(text.isEmpty)
        }
        .padding()
    }
}

#Preview {
    CaptureView()
}
