//
//  ViewController.swift
//  Lesson_16_UIImageView
//
//  Created by Екатерина Алексеева on 28.04.2022.
//

import UIKit

class ViewController: UIViewController {
    var myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myImageView = UIImageView(image: UIImage(named: "1"))
        myImageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        myImageView.contentMode = .scaleToFill
        myImageView.center = self.view.center
        //myImageView.image = UIImage(named: "1")
        myImageView.layer.borderWidth = 2
        myImageView.layer.borderColor = CGColor(red: 0, green: 1, blue: 1, alpha: 1)
        myImageView.layer.cornerRadius = 20
        myImageView.clipsToBounds = true
        self.view.addSubview(myImageView)
    }


}

