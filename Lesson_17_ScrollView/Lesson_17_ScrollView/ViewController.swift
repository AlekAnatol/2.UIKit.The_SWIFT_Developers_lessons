//
//  ViewController.swift
//  Lesson_17_ScrollView
//
//  Created by Екатерина Алексеева on 28.04.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var mySrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstImage = UIImage(named: "1")
        let secondImage = UIImage(named: "2")
        let thirdImage = UIImage(named: "3")
        
        
        mySrollView.contentSize = CGSize(width: view.bounds.width * 3, height: view.bounds.height)
        mySrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        //create first ImageView
        var imageRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        let firstImageView = createImageViewWithImage(paramImage: firstImage!, paramRect: imageRect)
        mySrollView.addSubview(firstImageView)
        
        //create second ImageView
        imageRect.origin.x += view.bounds.width
        let secondImageView = createImageViewWithImage(paramImage: secondImage!, paramRect: imageRect)
        mySrollView.addSubview(secondImageView)
        
        //create third ImageView
        imageRect.origin.x += view.bounds.width
        let thirdImageView = createImageViewWithImage(paramImage: thirdImage!, paramRect: imageRect)
        mySrollView.addSubview(thirdImageView)
        
        mySrollView.isPagingEnabled = true
        view.addSubview(mySrollView)
        
        //createScrollView()
        //self.view.addSubview(myImageView)
        
        
    }
    
    func createImageViewWithImage(paramImage: UIImage, paramRect: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramRect)
        result.image = paramImage
        return result
    }
    
    /*
    //MARK: - UIScrollViewDelegate
    

    //MARK: - createScrollView
    fileprivate func createScrollView() {
        let imageToLoad = UIImage(named: "2")
        myImageView = UIImageView(image: imageToLoad)
        mySrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height/2))
        mySrollView.center = view.center
        mySrollView.addSubview(myImageView)
        mySrollView.contentSize = myImageView.bounds.size // обязательно указываем, иначе скролл не буде работать
        mySrollView.delegate = self
        view.addSubview(mySrollView)
    }
     */
}

