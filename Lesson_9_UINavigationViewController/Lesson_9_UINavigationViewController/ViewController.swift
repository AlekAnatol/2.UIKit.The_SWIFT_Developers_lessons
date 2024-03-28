//
//  ViewController.swift
//  Lesson_9_UINavigationViewController
//
//  Created by Екатерина Алексеева on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First VC"
        
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("Second VC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
        self.view.addSubview(displaySecondButton)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                                target: self,
                                                                action: #selector(performDisplaySecondVC))
    }

    @objc func performDisplaySecondVC(parametrSender: Any) {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    

}

