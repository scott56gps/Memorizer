//
//  TranscriptionError.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//

enum TranscriptionError: Error {
    case speechPermissionDenied
    case microphonePermissionDenied
    case recognitionRequestFailed
}
