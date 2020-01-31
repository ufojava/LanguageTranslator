//
//  PlaySound.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 30/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Function to read text
import Foundation
import AVFoundation


func readRandomEnglishWord(word: String) {
    
    let utterance = AVSpeechUtterance(string: word)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    utterance.rate = 0.1
    
    let synthersizer = AVSpeechSynthesizer()
    synthersizer.speak(utterance)
}
