//
//  ViewController.swift
//  Lesson_15_UIButton
//
//  Created by Екатерина Алексеева on 27.04.2022.
//

import UIKit

class ViewController: UIViewController {
    var myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.layer.cornerRadius = 15
        myButton.frame = CGRect(x: 100, y: 250, width: 60, height: 30)
        myButton.backgroundColor = .cyan
        myButton.setTitle("Bubu", for: .normal)
        self.view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
    }

    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button is tapped")
    }
}

