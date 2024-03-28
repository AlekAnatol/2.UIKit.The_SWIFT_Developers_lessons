//
//  GeneralMenuViewController.swift
//  Lesson_27_UICollectionView
//
//  Created by Екатерина Алексеева on 31.05.2022.
//

import UIKit

class GeneralMenuViewController: UIViewController {

    var collectionView = UICollectionView()
    let collectionArray = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds)
        collectionView.setCollectionViewLayout(collectionView.collectionViewLayout, animated: true)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cellMenu")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.backgroundColor = .purple
        self.title = "GeneralMenuViewController"
    }
  
}



extension GeneralMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        //return collectionArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMenu", for: indexPath)
        cell = MyCollectionViewCell(image: "1", subscribeLabel: "Flower", typeOfButton: .add)
        
        return cell
    }
    
    
}
