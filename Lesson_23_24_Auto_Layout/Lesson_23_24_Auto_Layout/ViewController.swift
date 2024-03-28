//
//  ViewController.swift
//  Lesson_23_24_Auto_Layout
//
//  Created by Екатерина Алексеева on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var redView = UIView()
    var blueView = UIView()
    var greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        createRedView()
        createBlueView()
        createGreenView()
    }
        
//MARK: - NSLayoutAnchor
    func createRedView() {
        redView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        redView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    }
    
    func createBlueView() {
        blueView.rightAnchor.constraint(equalTo: redView.rightAnchor).isActive = true
        blueView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 30).isActive = true
    }
    
    func createGreenView() {
        greenView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        greenView.leftAnchor.constraint(equalTo: redView.leftAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 30).isActive = true
    }
        /*
    //MARK: - VFL
        let viewVFL = ["redView": redView, "blueView": blueView, "greenView": greenView]
        let metrics = ["heightRed": view.bounds.height/2,
                       "height": view.bounds.height/8,
                       "widthRed": view.bounds.width/2,
                       "width": view.bounds.width/4,
                       "trailler": view.bounds.width/8,
                       "top": view.bounds.height/8]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:         "V:|-top-[redView(widthRed)]-(30)-[blueView(height)]-(200)-|",
                                                          options: [],
                                                          metrics: metrics,
                                                          views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:         "V:|-top-[redView(widthRed)]-top-[greenView(height)]-(200)-|",
                                                          options: [],
                                                          metrics: metrics,
                                                          views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-width-[redView(widthRed)]-width-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-trailler-[blueView(width)]-[greenView(width)]-trailler-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
    }

*/
}

