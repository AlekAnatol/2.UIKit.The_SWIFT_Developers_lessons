//
//  ViewController.swift
//  Lesson_5_UIPickerView
//
//  Created by Екатерина Алексеева on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker.layer.cornerRadius = CGFloat(8)
        picker.backgroundColor = UIColor.magenta
        picker.center = view.center
        //Подписываемся на протокол
        picker.dataSource = self
        picker.delegate = self
        
        view.addSubview(picker)
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 5
        } else if component == 1 {
            return 9
        } else {
            return 3
        }
    }
}
    
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "Row = \(row)"
        return result
    }
}
