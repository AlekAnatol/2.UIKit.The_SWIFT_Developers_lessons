//
//  MyCell.swift
//  lesson_25_UITableView
//
//  Created by Екатерина Алексеева on 31.07.2023.
//

import SnapKit
import UIKit

class MyCell: UITableViewCell {
    lazy var wrapper: UIView = {
        let wrapper = UIView()
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.backgroundColor = .orange
        wrapper.layer.masksToBounds = true
//        wrapper.layer.shadowColor = UIColor.green.cgColor //AppColors.onlyblack.cgColor
//        wrapper.layer.shadowOffset = CGSize(width: 3.0, height: 4.0)
//        wrapper.layer.shadowOpacity = 0.07
//        wrapper.layer.shadowRadius = 15
        wrapper.layer.cornerRadius = 8
        return wrapper
    }()
    
    lazy var currentView = UIView()
    lazy var descriptionLabel = UILabel()
    lazy var editButton = UIButton()
    lazy var removeButton = UIButton()
    
    func setupUI() {
        contentView.addSubview(wrapper)
        wrapper.snp.makeConstraints{
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
        
        wrapper.addSubview(currentView)
        currentView.snp.makeConstraints {
            $0.edges.equalToSuperview() }
        
        currentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
                .inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
        
        currentView.addSubview(editButton)
        editButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        currentView.addSubview(removeButton)
        removeButton.snp.makeConstraints {
            //$0.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            $0.bottom.right.equalToSuperview().inset(16)
            //$0.left.equalTo(editButton.snp.right).offset(16)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
