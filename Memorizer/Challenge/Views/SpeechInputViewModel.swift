//
//  SpeechInputViewModel.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//
import SwiftUI
import Combine

final class SpeechInputViewModel: ObservableObject {
    @Published var isListening: Bool = false
    @Published var text: String = ""
    
    let transcriber: Transcriber
    
    init(transcriber: Transcriber) {
        self.transcriber = transcriber
    }

    func handle(_ event: TranscriptionEvent) {
        switch event {
        case .started: self.isListening = true
        case .stopped: self.isListening = false
        case .emitted(let text): self.text = text
        case .failed(let error): self.text = "Error: \(error.localizedDescription)"
        }
    }

    func startTranscription() {
        transcriber.startTranscription(eventHandler: handle)
    }

    func stopTranscription() {
        transcriber.stopTranscription()
    }
}

