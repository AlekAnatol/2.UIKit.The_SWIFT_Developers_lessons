//
//  ViewController.swift
//  Lesson_13_TextField
//
//  Created by Екатерина Алексеева on 27.04.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        myTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShowNotification), name: UITextField.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification), name: UITextField.keyboardWillHideNotification, object: nil)
    }

//MARK: - CreateTextField
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 150, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "I swift developer"
        myTextField.center = self.view.center
        myTextField.clearButtonMode = .whileEditing
        view.addSubview(myTextField)
    }
    
 //MARK: - TextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
        // return NO to disallow editing.
    }

 /*
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
    }

    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    }

    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    // if implemented, called in place of textFieldDidEndEditing:
    }
    
  */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "b" {
            print("Yep, here is 'B'")
        }
    // return NO to not change text
        
        return true
    }
    
 
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //print("textFieldDidChangeSelection")
    }

    
   
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("textFieldShouldClear")
        return true
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // called when 'return' key pressed. return NO to ignore.
        print("textFieldShouldReturn")
        if textField == myTextField {
            textField.resignFirstResponder()
        }
        return false
    }
  
    @objc func keyboardDidShowNotification() {
        self.view.frame.origin = CGPoint(x: 0, y: -150)
    }
    
    @objc func keyboardWillHideNotification() {
        self.view.frame.origin = CGPoint(x: 0, y: 0)
    }
}

