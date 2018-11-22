//
//  Categoriess.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/29/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import SwiftyJSON

class Categories : NSObject {
    
    private var _title : String?
    private var _imageLarge : String?
    private var _featuredImage : [String : JSON]?
    
    var title : String? {
        return _title
    }
    var featuredImage : [String : JSON]?{
        return _featuredImage
    }
    var imageLarge : String? {
        return _imageLarge
    }
    
    init?(dic : [String
        :
        JSON]) {
        guard let title = dic["title"]?.string
            ,let featuredImage = dic["featured_image"]?.dictionary
            , let imageLarge = featuredImage["large"]?.string
            else {return}
        self._featuredImage = featuredImage
        self._imageLarge = imageLarge
        self._title = title
    }
    
}

