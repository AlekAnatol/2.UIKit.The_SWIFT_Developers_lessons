//
//  ViewController.swift
//  Lesson_4_UISwitch
//
//  Created by Екатерина Алексеева on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {
    let mySwitch = UISwitch()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Создали свитч
        mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        view.addSubview(mySwitch)
        
       //Свитч включен
        mySwitch.setOn(true, animated: true)
        
        //Проверка на включенность
        if mySwitch.isOn {
            print("sw on")
        } else {
            print("sw off")
        }
        
        mySwitch.addTarget(self, action: #selector(switchChanged(paramTarget:  )), for: .valueChanged)
    }
  
    @objc func switchChanged(paramTarget: UISwitch) {
        //print("param is = ", paramTarget)
        if paramTarget.isOn {
            print("sw on")
        } else {
            print("sw off")
        }
    }
}
