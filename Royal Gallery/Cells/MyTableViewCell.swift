//
//  MyTableViewCell.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/29/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit
import SDWebImage
class MyTableViewCell: UITableViewCell {
    var cat : Categories?

    @IBOutlet weak var titleLabl_lbl: UILabel!
    @IBOutlet weak var imageView_img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(category : Categories){
        self.cat = category
        self.titleLabl_lbl.text = cat?.title
  if let url = URL(string : (cat?.imageLarge)!) {
    print(url)
    self.imageView_img.sd_setImage(with: url, completed: nil)
        }
    }
}
