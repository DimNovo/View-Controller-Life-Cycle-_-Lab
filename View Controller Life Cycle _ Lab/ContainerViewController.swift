//
//  ContainerViewController.swift
//  View Controller Life Cycle _ Lab
//
//  Created by Dmitry Novosyolov on 17/01/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    static var lineCounter = 0
    
    @IBOutlet weak var textView: UITextView!
    
    func update(caller: String) {
        ContainerViewController.lineCounter += 1
        
        guard let text = textView.text else { return (textView.text = "\(ContainerViewController.lineCounter): \(caller)") }
        textView.text = "\(text)\n\(ContainerViewController.lineCounter): \(caller)"
        
        let y = textView.contentSize.height - textView.bounds.size.height
        
        guard 0 < y else { return }
        textView.setContentOffset(CGPoint(x: 0, y: y), animated: true)
    }
}

