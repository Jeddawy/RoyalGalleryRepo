//
//  SegmentViewController.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/29/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {
    @IBOutlet weak var vcViewer: UIView!
    let collectionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewVC") as! CollectionViewVC
    let tableViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewVC") as! TableViewVC
    
    @IBOutlet weak var segmtent_gmnt: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.purple
        addChild(collectionVC)
        vcViewer.addSubview(collectionVC.view)
        
    }
    
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            vcViewer.addSubview(collectionVC.view)
            collectionVC.didMove(toParent: self)
        case 1:
            vcViewer.addSubview(tableViewVC.view)
            tableViewVC.didMove(toParent: self)
        default:
            break
        }
        
    }
    
}


