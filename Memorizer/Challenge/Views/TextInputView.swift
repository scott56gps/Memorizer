//
//  TextInputView.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//
import SwiftUI

struct TextInputView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .border(.blue)
    }
}
