//
//  ViewController.swift
//  simpletts
//
//  Created by 강상묵 on 21/04/2019.
//  Copyright © 2019 sang-mook.kang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var checkBoxJp: NSButton!
    @IBOutlet weak var checkBoxKor: NSButton!
    @IBOutlet var clearButton: NSView!
    @IBOutlet weak var messageField: NSTextField!
    @IBOutlet weak var sayButton: NSButton!
    var speech : NSSpeechSynthesizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        speech = NSSpeechSynthesizer.init()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func onCheckBoxKorClicked(_ sender: Any) {
        checkBoxJp?.state = NSControl.StateValue.off
        
        let voices = NSSpeechSynthesizer.availableVoices
        voices.filter { voice in voice.rawValue == "com.apple.speech.synthesis.voice.yuna.premium" }
            .map{ yuna in speech.setVoice(yuna)}

    }
    
    @IBAction func onCheckBoxJpClicked(_ sender: Any) {
        checkBoxKor?.state = NSControl.StateValue.off
        
        let voices = NSSpeechSynthesizer.availableVoices
        voices.filter{ voice in voice.rawValue == "com.apple.speech.synthesis.voice.kyoko" }
            .map { kyoko in speech.setVoice(kyoko)}
    }
    
    @IBAction func onClearButtonClicked(_ sender: Any) {
        messageField.stringValue = ""
    }
    
    @IBAction func onSayButtonClicked(_ sender: NSButton) {
        let message = messageField.stringValue
        print(message)
        
        let voices = NSSpeechSynthesizer.availableVoices
        voices.forEach{ voice in
            print(voice.rawValue)
        }
        
        speech.startSpeaking(message)
    }
    
}

