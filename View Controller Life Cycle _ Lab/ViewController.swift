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
    
    var num = 0
    
    @IBOutlet weak var displayDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColor()
        guard (displayDataLabel?.text != nil)
            else {return}
        num += 1
        displayDataLabel.text?
            .append("\(num).\(#function)\n")
        speak(text: "New functions number: \(displayDataLabel.text!)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentColor()
        guard (displayDataLabel?.text != nil)
            else {return}
        num += 1
        displayDataLabel.text?
            .append("\(num).\(#function)\n")
        speak(text: "New functions number: \(displayDataLabel.text!)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentColor()
        guard (displayDataLabel?.text != nil)
            else {return}
        num += 1
        displayDataLabel.text?
            .append("\(num).\(#function)\n")
        speak(text: "New functions number: \(displayDataLabel.text!)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        currentColor()
        guard (displayDataLabel?.text != nil)
            else {return}
        num += 1
        displayDataLabel.text?
            .append("\(num).\(#function)\n")
        speak(text: "New functions number: \(displayDataLabel.text!)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        currentColor()
        guard (displayDataLabel?.text != nil)
            else {return}
        num += 1
        displayDataLabel.text?
            .append("\(num).\(#function)\n")
        speak(text: "New functions number: \(displayDataLabel.text!)")
    }
    
    @IBAction func displayClearButton(_ sender: UIButton) {
        guard (displayDataLabel?.text != nil)
            else {return}
        displayDataLabel.text?.removeAll()
        speak(text: "Clear all data!")
        num = 0
    }
    
    func currentColor()
    {
        guard let vc = tabBarController?
            .selectedViewController?.title!
            else {return}
        switch vc {
        case "RedVC":
            displayDataLabel?.textColor = .red
            tabBarController?.selectedViewController?
                .tabBarItem.badgeColor = .red
        case "GreenVC":
            displayDataLabel?.textColor = .green
            tabBarController?.selectedViewController?
                .tabBarItem.badgeColor = .green
        case "YellowVC":
            displayDataLabel?.textColor = .yellow
            tabBarController?.selectedViewController?
                .tabBarItem.badgeColor = .yellow
        default:
            break
        }
    }
    func speak(text: String) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.pitchMultiplier = 1
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.volume = 1
        utterance.voice = AVSpeechSynthesisVoice.init()
        speechSynthesizer.speak(utterance)
    }
}

