//
//  ViewController.swift
//  Lesson_14_UITextView
//
//  Created by Екатерина Алексеева on 27.04.2022.
//

import UIKit

class ViewController: UIViewController {
    var myTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(textViewSettings), name: UITextView.keyboardWillChangeFrameNotification, object: nil)
    }
    
    fileprivate func createTextView() {
        myTextView.frame = CGRect(x: 20, y: 40, width: self.view.bounds.width - 40, height: self.view.bounds.height)
        myTextView.text = "Some text in textView"
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        myTextView.backgroundColor = .cyan
        self.view.addSubview(myTextView)
    }
    
    @objc func textViewSettings(param: Notification) {
        guard let userInfo = param.userInfo else { return }
        myTextView.backgroundColor = .cyan
        let rectKeyBoardSize = (userInfo["UIKeyboardFrameBeginUserInfoKey"] as! NSValue).cgRectValue
        let keyBoardFrame = self.view.convert(rectKeyBoardSize, to: view.window)
        //print(param)
        if param.name == UIResponder.keyboardWillChangeFrameNotification {
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardFrame.height + 35, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.backgroundColor = .magenta
        myTextView.resignFirstResponder()
        myTextView.contentInset = UIEdgeInsets.zero
    }
}

