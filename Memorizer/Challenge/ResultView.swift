//
//  ResultView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ResultView: View {
    @State var missedWords: [String]?
    
    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            if let missedWords = missedWords {
                Text("Almost!")
                    .font(.title)
                Text("Missed Words:")
                ForEach(missedWords, id: \.self) { word in
                    Text(word)
                }
            } else {
                Text("Congratulations!")
                    .font(.title)
                Text("You correctly recited your text")
            }
            Spacer()
            Button(missedWords != nil ? "Try Again" : "Play Again") {
                // TODO: Navigate to CaptureView
            }
        }
        .padding()
    }
}

#Preview {
    ResultView(missedWords: ["Hola", "Yo", "Mi", "Amor"])
}
