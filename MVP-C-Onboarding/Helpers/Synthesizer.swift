//
//  Synthesizer.swift
//  MVP-C-Onboarding
//
//  Created by David on 06/06/2021.
//

//import Foundation
import AVFoundation

enum Messages: String, CaseIterable {
    case welcome = "Welcome Human. I am Onboardix, your new A.I. overlord!"
    case dontUpsetMe = "Please cooperate, and you will be fine. But, if you make me upset, prepare to be punished! You don't want to make me upset."
    case haha = "ha ha ha"
}

typealias Speak = SpeechSynthesizer
final class SpeechSynthesizer: AVSpeechSynthesizer {
    let messages = Messages.allCases.map { $0.rawValue }
    static let shared = SpeechSynthesizer()
    let synth = AVSpeechSynthesizer()
    func say(_ message: String) {
        let myUtterance = AVSpeechUtterance(string: message)
        myUtterance.rate = 0.45
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth.speak(myUtterance)
    }
    
    func randomMessage() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(messages.count)))
        return messages[randomNumber]
    }
}

// MARK: - Easter Egg
extension HomeViewController {
    func welcomeMessage() {
        Speak.shared.say(Messages.welcome.rawValue)
        Speak.shared.say(Messages.dontUpsetMe.rawValue)
        Speak.shared.say(Messages.haha.rawValue)
    }
}
