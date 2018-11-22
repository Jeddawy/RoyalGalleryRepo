//
//  MyCollectionViewCell.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/29/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit
import SDWebImage
class MyCollectionViewCell: UICollectionViewCell {
    var cat : Categories?
    @IBOutlet weak var imageView_img: UIImageView!
    @IBOutlet weak var titleLabel_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(category : Categories){
        self.cat = category
        self.titleLabel_lbl.text = cat?.title
        if let url = URL(string: (cat?.imageLarge)!){
            print(url)
            self.imageView_img.sd_setImage(with: url, completed: nil)
        }
        
    }

}
