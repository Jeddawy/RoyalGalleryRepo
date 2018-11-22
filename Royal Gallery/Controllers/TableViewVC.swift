//
//  TableViewCV.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/28/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var reuseIdentefire = "MyTableViewCell"
    var catArr = [Categories]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData()
    }
    func tableViewData(){
        tableView.register(UINib.init(nibName: reuseIdentefire, bundle: nil), forCellReuseIdentifier: reuseIdentefire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        APIManager.products { (message, categories) in
            if message != "success" {
                print("error")
            }else if let categories = categories{
                self.catArr = categories
                self.tableView.reloadData()
                
                print(self.catArr.count)
            }
        }
    }
    
}

extension TableViewVC : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.catArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("<---- categories count", self.catArr.count)
        print("-------------------------------------")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentefire, for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(category: self.catArr[indexPath.section])
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.clipsToBounds = true
        print(self.catArr.count)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
}
