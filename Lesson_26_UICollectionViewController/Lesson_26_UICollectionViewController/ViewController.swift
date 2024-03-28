//
//  ViewController.swift
//  Lesson_26_UICollectionViewController
//
//  Created by Екатерина Алексеева on 29.05.2022.
//

import UIKit

class ViewController: UIViewController  {
    
    //let nameArray = ["Valera", "Tamara", "Gilbert", "Lizzi"]
    var dateArray = [Date]()
    let cellIdentifire = "myCell"
    var tableViewController = UITableViewController()
    var myRefresh = UIRefreshControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController = UITableViewController(style: .plain)
        
        tableViewController.tableView = UITableView(frame: view.bounds, style: .plain)
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        
        myRefresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(myRefresh)
    }

    @objc func handleRefresh() {
        let currentDate = Date()
        dateArray.append(currentDate)
        tableViewController.tableView.reloadData()
        myRefresh.endRefreshing()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return nameArray.count
        return dateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        //cell.textLabel?.text = nameArray[indexPath.row]
        cell.textLabel?.text = "\(dateArray[indexPath.row])"
        return cell
    }
}
