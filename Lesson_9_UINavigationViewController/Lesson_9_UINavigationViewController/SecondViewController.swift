//
//  SecondViewController.swift
//  Lesson_9_UINavigationViewController
//
//  Created by Екатерина Алексеева on 26.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(goBack), with: nil, afterDelay: 2.0)
    }
    
    @objc func goBack() {
        //self.navigationController?.popViewController(animated: true)
        // Получаем текущий массив контроллеров
        var currentControllerArray = self.navigationController?.viewControllers
        
        //Удалаем последний контроллер
        currentControllerArray?.removeLast()
        
        //присвоим новую очередь навигейшн контроллеру
        if let newControllerArray = currentControllerArray {
            self.navigationController?.viewControllers = newControllerArray
        }
    }
    
}
