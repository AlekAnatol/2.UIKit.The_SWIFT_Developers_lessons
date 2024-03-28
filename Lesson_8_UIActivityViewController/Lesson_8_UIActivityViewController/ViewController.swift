//
//  ViewController.swift
//  Lesson_8_UIActivityViewController
//
//  Created by Екатерина Алексеева on 24.04.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }

 // MARK: - Methods
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: view.frame.midX - 140, y: view.frame.midY + 50, width: 280, height: 44)
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = textField.text
        if text?.count == 0 {
            let massage = "Print text at first then press Share"
            let alertController = UIAlertController(title: nil, message: massage, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        self.present(activityViewController!, animated: true, completion: nil)
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


