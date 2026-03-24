//
//  ResultView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

struct ResultView: View {
    var navigators: RoutingActions
    @State var missedMemorizedText: (String, [Substring])
    var hasMissedText: Bool {
        missedMemorizedText.1.isEmpty == false
    }

    var body: some View {
        VStack {
            Text("Memorizer")
                .font(.largeTitle)
            Spacer()
            if hasMissedText {
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
            Button(hasMissedText ? "Try Again" : "Play Again") {
                navigators.showCapture()
            }
        }
        .padding()
    }
}

#Preview {
    AppViewBuilder.buildPreview(screen: .result(("My bonnie flies over the ocean", ["My", "flies"])))
}
