//
//  ResultView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var router: Router
    @State var missedMemorizedText: (String, [Substring])?

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            if let missedMemorizedText = missedMemorizedText {
                Text("Almost!")
                    .font(.title)
                Text("Missed Words:")
                ForEach(missedMemorizedText.1, id: \.self) { word in
                    Text(word)
                }
            } else {
                Text("Congratulations!")
                    .font(.title)
                Text("You correctly recited your text")
            }
            Spacer()
            Button(missedMemorizedText != nil ? "Try Again" : "Play Again") {
                // TODO: Navigate to CaptureView
                router.showCapture()
            }
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .result(("My bonnie flies over the ocean", ["My", "flies"])))
}
