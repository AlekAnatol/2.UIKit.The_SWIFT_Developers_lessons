//
//  ViewController.swift
//  Lesson_7_UISegmenrdControl
//
//  Created by Екатерина Алексеева on 21.04.2022.
//

import UIKit

class ViewController: UIViewController {
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var addButton = UIButton()
    
    var menuArray = ["спацик", "рыжик", "драцена"]
    var imageArray = [UIImage(named: "1.jpeg"), UIImage(named: "2.jpeg"), UIImage(named: "3.jpg")]
    var addedItemsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl = UISegmentedControl(items: menuArray)
        segmentControl.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        
        imageView.image = imageArray[0]
        imageView.frame = CGRect(x: 50, y: 150, width: 300, height: 300)
        view.addSubview(imageView)
        
        addButton.frame = CGRect(x: 0, y: 700, width: 60, height: 50)
        addButton.center.x = view.center.x
        addButton.layer.cornerRadius = 5
        addButton.backgroundColor = UIColor.green
        addButton.setTitle("add", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.setTitleColor(UIColor.green, for: .highlighted)
        view.addSubview(addButton)
        
        segmentControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    @objc func segmentSelected(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentNumber = target.selectedSegmentIndex
            imageView.image = imageArray[segmentNumber]
        }
    }
    
    @objc func addButtonPressed(target: UIButton) {
        if target == self.addButton {
            let index = segmentControl.selectedSegmentIndex
            //print(segmentControl.titleForSegment(at: index))
            guard let addedElemet = segmentControl.titleForSegment(at: index)
            else { return }
            addedItemsArray.append(addedElemet)
            print(addedItemsArray)
        }
    }
}

