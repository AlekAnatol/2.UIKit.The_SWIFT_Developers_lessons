//
//  ViewController.swift
//  lesson_25_UITableView
//
//  Created by Екатерина Алексеева on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var myTableView = UITableView()
    let nameArray = ["Masha gdgfxb,gklfkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkmlkm", "Sasha", "Pasha", "Lesha", "Ksusha"]
    let identifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }

    fileprivate func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .insetGrouped )
        // Регистрируем идентификатор ячеек
        myTableView.register(MyCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        // Автоизменение ячеек, при повороте ориентации устройчтва длина ячеек будет меняться пропорционально
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        view.addSubview(myTableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
        view.backgroundColor = UIColor.purple
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count - section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MyCell
        else  { return UITableViewCell() }
        
        cell.setupUI()
//        cell.wrapper.backgroundColor = .orange
        
        if indexPath.section % 2 == 0 {
                   cell.currentView.backgroundColor = .blue
        }

        
//        if indexPath.section % 2 == 0 {
//            cell.accessoryType = .checkmark
//        }
        
        cell.descriptionLabel.text = nameArray[indexPath.row]
        cell.descriptionLabel.textAlignment = .center
        cell.editButton.backgroundColor = .green
        cell.editButton.setTitle("edit", for: .normal)
        cell.editButton.setTitleColor(.black, for: .highlighted)
        cell.removeButton.backgroundColor = .gray
        cell.removeButton.setTitle("remove", for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(indexPath)
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
