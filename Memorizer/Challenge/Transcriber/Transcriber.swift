//
//  Transcriber.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//

protocol Transcriber {
    func startTranscription(eventHandler: @escaping (TranscriptionEvent) -> Void)
    func stopTranscription()
}
