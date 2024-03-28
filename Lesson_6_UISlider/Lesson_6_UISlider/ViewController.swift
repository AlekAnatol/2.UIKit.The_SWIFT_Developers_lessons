//
//  ViewController.swift
//  Lesson_6_UISlider
//
//  Created by Екатерина Алексеева on 20.04.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    var videoPlayer = AVPlayer()
    var startButton = UIButton()
    var pauseButton = UIButton()
    var nextButton = UIButton()
    var previouseButton = UIButton()
    var scrollSlider = UISlider()
    var volumeSlider = UISlider()
    var scrollLabel = UILabel()
    var volumeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // startButton settings
        startButton.frame = CGRect(x: self.view.frame.width/2 - 60, y: 550, width: 50, height: 50)
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = UIColor.green
        startButton.setTitleColor(UIColor.black, for: .normal)
        startButton.setTitleColor(UIColor.green, for: .highlighted)
        startButton.setTitle("Start", for: .normal)
        view.addSubview(startButton)
        
        // pauseButton settings
        pauseButton.frame = CGRect(x: self.view.frame.width/2 + 10, y: 550, width: 50, height: 50)
        pauseButton.layer.cornerRadius = 25
        pauseButton.backgroundColor = UIColor.magenta
        pauseButton.setTitleColor(UIColor.black, for: .normal)
        pauseButton.setTitleColor(UIColor.magenta, for: .highlighted)
        pauseButton.setTitle("Pause", for: .normal)
        view.addSubview(pauseButton)
        
        // nextButton settings
        nextButton.frame = CGRect(x: self.view.frame.width/2 + 80, y: 550, width: 50, height: 50)
        nextButton.layer.cornerRadius = 25
        nextButton.backgroundColor = UIColor.yellow
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitleColor(UIColor.yellow, for: .highlighted)
        nextButton.setTitle("Next", for: .normal)
        view.addSubview(nextButton)
        
        // previouseButton settings
        previouseButton.frame = CGRect(x: self.view.frame.width/2 - 130, y: 550, width: 50, height: 50)
        previouseButton.layer.cornerRadius = 25
        previouseButton.backgroundColor = UIColor.yellow
        previouseButton.setTitleColor(UIColor.black, for: .normal)
        previouseButton.setTitleColor(UIColor.yellow, for: .highlighted)
        previouseButton.setTitle("Prev", for: .normal)
        view.addSubview(previouseButton)
        
        // scrollSlider settings
        scrollSlider.frame = CGRect(x: self.view.frame.width/2 - 160, y: 130, width: 320, height: 50)
        scrollSlider.minimumValue = 0.0
        scrollSlider.maximumValue = 100.0
        view.addSubview(scrollSlider)
        
        // scrollLabel settings
        scrollLabel.frame = CGRect(x: self.view.frame.width/2 - 30, y: 100, width: 60, height: 50)
        scrollLabel.text = "Scroll"
        view.addSubview(scrollLabel)
        
        // volumeSlider settings
        volumeSlider.frame = CGRect(x: self.view.frame.width/2 - 160, y: 200, width: 320, height: 50)
        view.addSubview(volumeSlider)
        
        // volumeLabel settings
        volumeLabel.frame = CGRect(x: self.view.frame.width/2 - 30, y: 170, width: 60, height: 50)
        volumeLabel.text = "Volume"
        view.addSubview(volumeLabel)
        
        // videoPlayerSettings
        let videoLayer = AVPlayerLayer(player: videoPlayer)
        videoLayer.frame = CGRect(x: self.view.frame.width/2 - 160, y: 230, width: 320, height: 200)
        view.layer.addSublayer(videoLayer)
        videoPlayer.play()
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        previouseButton.addTarget(self, action: #selector(previouseButtonPressed), for: .touchUpInside)
        scrollSlider.addTarget(self, action: #selector(scrollSliderChanged), for: .valueChanged)
        volumeSlider.addTarget(self, action: #selector(volumeSliderChanged), for: .valueChanged)
        //audioPlayer.forwardingTarget(for: #selector(audioDuraionChanged))
        
        do {
            guard let audioLuisPath = Bundle.main.path(forResource: "luis", ofType: "mp3"),
                    let videoPath = Bundle.main.path(forResource: "video", ofType: "mp4")
            else { return }
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioLuisPath))
            videoPlayer = AVPlayer(url: URL(fileURLWithPath: videoPath))
            scrollSlider.maximumValue = Float(audioPlayer.duration)
            scrollSlider.value = Float(audioPlayer.currentTime)
        }
        catch {
            print("Error")
        }
    }
    
    @objc func startButtonPressed() {
        volumeSlider.value = audioPlayer.volume
        scrollSlider.value = Float(audioPlayer.currentTime)
        audioPlayer.play()
        videoPlayer.play()
    }
    
    @objc func pauseButtonPressed() {
        audioPlayer.pause()
        videoPlayer.pause()
    }
    
    @objc func nextButtonPressed() {
        guard let audioLuisPath = Bundle.main.path(forResource: "luis", ofType: "mp3"),
              let audioShakiraPath = Bundle.main.path(forResource: "shakira", ofType: "mp3")
        else { return }
        
        let URLLuis = URL(fileURLWithPath: audioLuisPath)
        let URLShakira = URL(fileURLWithPath: audioShakiraPath)
        
        if audioPlayer.url == URLLuis {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: URLShakira)
                scrollSlider.maximumValue = Float(audioPlayer.duration)
                scrollSlider.value = Float(audioPlayer.currentTime)
            } catch {
                print("NextButton Error")
            }
            audioPlayer.play()
            //videoPlayer.play()
        } else if audioPlayer.url == URLShakira {
            audioPlayer.pause()
        }
    }
    
    @objc func previouseButtonPressed() {
        guard let audioLuisPath = Bundle.main.path(forResource: "luis", ofType: "mp3"),
              let audioShakiraPath = Bundle.main.path(forResource: "shakira", ofType: "mp3")
        else { return }
        
        let URLLuis = URL(fileURLWithPath: audioLuisPath)
        let URLShakira = URL(fileURLWithPath: audioShakiraPath)
        
        if audioPlayer.url == URLShakira {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: URLLuis)
                scrollSlider.maximumValue = Float(audioPlayer.duration)
                scrollSlider.value = Float(audioPlayer.currentTime)
            } catch {
                print("PreviouseButton Error")
            }
            audioPlayer.play()
            
        } else if audioPlayer.url == URLLuis {
            audioPlayer.pause()
        }
    }
    
    @objc func scrollSliderChanged(sender: UISlider) {
        if sender == scrollSlider {
//            scrollSlider.minimumValue = 0.0
//            scrollSlider.maximumValue = Float(audioPlayer.duration)
            audioPlayer.currentTime = TimeInterval(sender.value)
            audioPlayer.play()
            //scrollSlider.value = Float(audioPlayer.currentTime)
        }
    }
    
    @objc func volumeSliderChanged(sender: UISlider) {
        if sender == volumeSlider {
            audioPlayer.volume = sender.value
        }
    }
    
//    @objc func audioDuraionChanged(sender: AVAudioPlayer) {
//        scrollSlider.value = Float(sender.currentTime)
//    }
}

