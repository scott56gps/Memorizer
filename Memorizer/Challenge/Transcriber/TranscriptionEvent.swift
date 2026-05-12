//
//  TranscriptionEvent.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//

enum TranscriptionEvent {
    case started
    case stopped
    case emitted(String)
    case failed(Error)
}
