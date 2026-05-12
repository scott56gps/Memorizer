//
//  TextInputView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//
import SwiftUI

struct TextInputLayout: View {
    @Binding var text: String
    @FocusState private var editorIsFocused: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $text, axis: .vertical)
                .lineLimit(6...)
                .textFieldStyle(.roundedBorder)
                .border(Color.blue)
                .focused($editorIsFocused)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    editorIsFocused = false
                }
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextInputLayout(text: $text)
}
