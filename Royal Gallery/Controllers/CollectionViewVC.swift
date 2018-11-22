//
//  ViewController.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/28/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var categoryArr = [Categories]()
    var reuseIdentefire = "MyCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViews()
        APIManager.products { (message, categories) in
            if message != "success" {
                print("error")
            }else if let categories = categories{
                self.categoryArr = categories
                self.collectionView.reloadData()
                print(self.categoryArr.count)
            }
        }
        
    }
    func collectionViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: reuseIdentefire, bundle: nil), forCellWithReuseIdentifier: reuseIdentefire)
    }
    
}

extension CollectionViewVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentefire, for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(category: self.categoryArr[indexPath.row])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    
    
}
