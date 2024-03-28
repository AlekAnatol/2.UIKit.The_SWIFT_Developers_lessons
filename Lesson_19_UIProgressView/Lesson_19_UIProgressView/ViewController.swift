//
//  ViewController.swift
//  Lesson_19_UIProgressView
//
//  Created by Екатерина Алексеева on 30.04.2022.
//

import UIKit

final class ViewController: UIViewController {
    private var myProgressView = UIProgressView()
    private var myStartButton = UIButton()
    private var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        createProgeressView(myProgressView)
        createButton(myStartButton)
        //createTimer()
        myStartButton.addTarget(self, action: #selector(createTimer), for: .touchUpInside)
    }
    
    //MARK: - Timer Settings
    @objc func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    //MARK: - Selector
    @objc func updateProgressView() {
        if myProgressView.progress < 1.0 {
            let currentProgress = myProgressView.progress
            myProgressView.setProgress(currentProgress + 0.2 , animated: false)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.myStartButton.frame = CGRect(x: self.view.center.x - 75,
                                                  y: self.view.center.y + 135,
                                                  width: 150,
                                                  height: 40)
                self.myStartButton.setTitle("Load Finished", for: .normal)
            }
            myTimer.invalidate()
        }
    }
    
    //MARK: - UISettings
    private func createProgeressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .default
        progressView.frame = CGRect(x: view.center.x - 85, y: view.center.y - 25, width: 170, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.tintColor = .cyan
        progressView.trackTintColor = .orange
        view.addSubview(progressView)
    }

    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.center.x - 30, y: view.center.y + 135, width: 60, height: 40)
        button.layer.cornerRadius = 10
        button.backgroundColor = .cyan
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.cyan, for: .highlighted)
        view.addSubview(button)
    }
}

