//
//  ViewControllerDataPicker.swift
//  Lesson_5_UIPickerView
//
//  Created by Екатерина Алексеева on 14.04.2022.
//

import UIKit

class ViewControllerDataPicker: UIViewController {
    let picker = UIDatePicker()
    let startButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.center = view.center
        picker.datePickerMode = .countDownTimer
        //picker.countDownDuration = 2 * 60
        view.addSubview(picker)
        
        startButton.frame = CGRect(x: view.center.x - 25, y: view.center.y - 350, width: 60, height: 60)
        startButton.backgroundColor = UIColor.yellow
        startButton.setTitleColor(UIColor.blue, for: .normal)
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 30
        view.addSubview(startButton)
        
//        var oneYearTime = TimeInterval()
//        oneYearTime = 365 * 24 * 60 * 60
//        let todayDate = Date()
//        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
//        let twoYearFromToday = todayDate.addingTimeInterval(2 * oneYearTime)
//
//        picker.minimumDate = oneYearFromToday
//        picker.maximumDate = twoYearFromToday
    
        picker.addTarget(self, action: #selector(dateChanged(paramDataPicker: )), for: .valueChanged)
        startButton.addTarget(self, action: #selector(startButtonPressed(button:)), for: .touchUpInside)
    }
    

    @objc func dateChanged(paramDataPicker: UIDatePicker) {
        if paramDataPicker.isEqual(self.picker) {
            print("Date changed = \(paramDataPicker.date)")
        } else {
            return
        }
    }
    
    @objc func startButtonPressed(button: UIButton) {
        //if button == self.startButton {
        print("Start pressed")
        picker.isUserInteractionEnabled = false
        startButton.isUserInteractionEnabled = false
        
        var minute = TimeInterval()
        minute = 60
        
        var currentlyTime = Date()
        let endedTime = currentlyTime.addingTimeInterval(picker.countDownDuration)
        print(currentlyTime, endedTime)
        while currentlyTime < endedTime {
                print(currentlyTime, endedTime)
                sleep(2)
                currentlyTime += minute
                picker.setDate(picker.date - minute, animated: true)
        }
            picker.isUserInteractionEnabled = true
            startButton.isUserInteractionEnabled = true
    }
}
