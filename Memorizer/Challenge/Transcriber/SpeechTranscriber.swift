//
//  SpeechTranscriber.swift
//  Memorizer
//
//  Created by Scott Nicholes on 4/23/26.
//
import Speech
import AVFoundation

/** This class will handle transcribing Speech. */
final class SpeechTranscriber: Transcriber {
    private let speechRecognizer: SFSpeechRecognizer?
    private let audioEngine = AVAudioEngine()
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private var eventHandler: ((TranscriptionEvent) -> Void)?
    private var stopRequested: Bool = false
    
    init() {
        self.speechRecognizer = SFSpeechRecognizer(locale: .current)
    }
    
    func startTranscription(
        eventHandler: @escaping (TranscriptionEvent) -> Void
    ) {
        self.stopRequested = false
        self.eventHandler = eventHandler
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                guard status == .authorized else {
                    self.eventHandler?(
                        .failed(TranscriptionError.speechPermissionDenied)
                    )
                    return
                }
                
                self.requestMicrophonePermission()
            }
        }
    }
    
    func stopTranscription() {
        self.stopRequested = true
        
        audioEngine.stop()
        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        
        recognitionTask = nil
        recognitionRequest = nil
        
        self.eventHandler?(.stopped)
    }
    
    private func requestMicrophonePermission() {
        AVAudioApplication.requestRecordPermission { granted in
            DispatchQueue.main.async {
                guard granted else {
                    self.eventHandler?(
                        .failed(TranscriptionError.microphonePermissionDenied)
                    )
                    return
                }
                
                self.configureAudioSession()
            }
        }
    }
    
    private func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session
                .setCategory(.record, mode: .measurement, options: .duckOthers)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            eventHandler?(.failed(error))
            return
        }
        
        startRecognitionPipeline()
    }

    private func startRecognitionPipeline() {
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest else {
            eventHandler?(.failed(TranscriptionError.recognitionRequestFailed))
            return
        }
        
        recognitionRequest.shouldReportPartialResults = true
        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: 0)
        
        inputNode
            .installTap(
                onBus: 0,
                bufferSize: 1024,
                format: format
            ) { buffer, _ in
                recognitionRequest.append(buffer)
            }
        
        recognitionTask = speechRecognizer?
            .recognitionTask(with: recognitionRequest) { result, error in
                if let result {
                    if self.stopRequested {
                        // If we're stopping, do not interpret anything else as input
                        return
                    }
                    // MARK: This is where we finally get the text and can detect things about the audio stream
                    let text = result.bestTranscription.formattedString
                    self.eventHandler?(.emitted(text))
                }
            
                if let error {
                    if self.stopRequested {
                        // If we're stopping, do not interpret anything else as input
                        return
                    }
                    self.eventHandler?(.failed(error))
                    self.stopTranscription()
                }
            }
        
        // 5. Start audio engine (where transcription truly begins)
        do {
            audioEngine.prepare()
            try audioEngine.start()
            
            eventHandler?(.started)
        } catch {
            eventHandler?(.failed(error))
        }
    }
}

