//
//  ViewController.swift
//  View Controller Life Cycle _ Lab
//
//  Created by Dmitry Novosyolov on 12/01/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var containerViewController: ContainerViewController!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerViewController = UIApplication.shared.windows.first?.rootViewController as? ContainerViewController
        
        name = tabBarItem.title
        
        guard containerViewController != nil else {
            print(#function, "can't get container view controller")
            return
        }
        update(#function)
        speak(text: name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        update(#function)
        speak(text: name)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        update(#function)
        speak(text: name)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        update(#function)
        speak(text: name)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        update(#function)
        speak(text: name)
    }
    
    override func viewWillLayoutSubviews() {
        update(#function)
        speak(text: name)
    }
    
    override func viewDidLayoutSubviews() {
        update(#function)
        speak(text: name)
    }
    
    func update(_ caller: String) {
        
        containerViewController.update(caller: "From \(name ?? "no name"): \(caller)")
    }
    
    func speak(text: String) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.pitchMultiplier = 1
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.volume = 0.5
        utterance.voice = AVSpeechSynthesisVoice.init()
        speechSynthesizer.speak(utterance)
    }
}

