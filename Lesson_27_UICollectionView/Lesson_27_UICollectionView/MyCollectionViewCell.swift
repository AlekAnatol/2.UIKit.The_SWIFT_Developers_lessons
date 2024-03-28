//
//  MyCollectionViewCell.swift
//  Lesson_27_UICollectionView
//
//  Created by Екатерина Алексеева on 03.06.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView?
    var subscribeLabel: UILabel?
    var button =  UIButton()
    
    init(image: String?, subscribeLabel: String?, typeOfButton: buttonEnum) {
        //let cell = UICollectionViewCell()
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        
        guard let imageName = image,
              let subscribeLabeltext = subscribeLabel else { return }
        
        imageView = UIImageView(frame: CGRect(x: 15, y: 15, width: self.contentView.bounds.width - 30,
                                              height: self.contentView.bounds.height / 2))
        imageView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        let image = UIImage(named: imageName)
        imageView?.image = image
        
        self.subscribeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.contentView.bounds.width - 30,
                                               height: 20))
        self.subscribeLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.subscribeLabel?.topAnchor.constraint(equalTo: imageView?.bottomAnchor ?? self.centerYAnchor, constant: 10).isActive = true
        self.subscribeLabel?.text = subscribeLabeltext
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 10))
        button.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.subscribeLabel?.bottomAnchor ?? self.centerYAnchor, constant: 10).isActive = true
        button.backgroundColor = .green
        
        switch typeOfButton {
        case .add:
            button.titleLabel?.text = "Add"
        case .detail:
            button.titleLabel?.text = "Detail"
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
