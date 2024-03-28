//
//  ViewControllerTwo.swift
//  Lesson_4_UISwitch
//
//  Created by Екатерина Алексеева on 14.04.2022.
//

import UIKit

class ViewControllerTwo: UIViewController {
    let mySwitch = UISwitch()
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Настройки свитча
        //mySwitch.frame = CGRect.zero
        mySwitch.center = view.center
        mySwitch.tintColor = UIColor.red
        mySwitch.onTintColor = UIColor.yellow
        mySwitch.thumbTintColor = UIColor.green
        mySwitch.onImage = UIImage(named: "On")
        mySwitch.offImage = UIImage(named: "Off")
        //mySwitch.backgroundColor = UIColor.black
        mySwitch.addTarget(self, action: #selector(switchChanged(paramTarget: )), for: .valueChanged)
        view.addSubview(mySwitch)
        
        //Настройки кнопки
        button.frame = CGRect(x: 100, y: 200, width: 250, height: 25)
        button.tintColor = UIColor.purple
        button.backgroundColor = UIColor.yellow
        button.setTitleColor(UIColor.magenta, for: .normal)
        button.setTitle("Hello, Katty", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.setTitle("Button pressed", for: .highlighted)
        view.addSubview(button)
    }
    

    @objc func switchChanged(paramTarget: UISwitch) {
        //print("param is = ", paramTarget)
        if paramTarget.isOn {
            button.isUserInteractionEnabled = false
            print("sw on")
        } else {
            button.isUserInteractionEnabled = true
            print("sw off")
        }
    }

}
