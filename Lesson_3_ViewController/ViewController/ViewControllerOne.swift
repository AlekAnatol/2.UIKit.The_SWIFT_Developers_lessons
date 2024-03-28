//
//  ViewControllerOne.swift
//  ViewController
//
//  Created by Екатерина Алексеева on 13.04.2022.
//

import UIKit

class ViewControllerOne: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.layer.cornerRadius = 20
        testView.layer.borderWidth = 3
        testView.layer.borderColor = UIColor.purple.cgColor
        testView.layer.shadowColor = UIColor.black.cgColor
        testView.layer.shadowOffset = CGSize(width: 10, height: 10)
        testView.layer.shadowRadius = 15
        testView.layer.shadowOpacity = 0.7
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Error", message: "Ahtung", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            let text = alertController.textFields?.first?.text
            print(text ?? "nil text")
        }
        alertController.addAction(action)
        alertController.addTextField { textField in
            textField.isOpaque = false
            textField.tintColor = .purple
            textField.backgroundColor = .yellow
        }
        self.present(alertController, animated: true)
        
        // Пробую различные аффинные преборазования
        
//        let transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        let rotation = CGAffineTransform(rotationAngle: .pi/4)
//
//        if testView.transform.isIdentity {
//            testView.transform = rotation.concatenating(transform)
//        } else {
//            testView.transform = .identity
//        }
    }
}
