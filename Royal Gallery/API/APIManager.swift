//
//  APIManager.swift
//  Royal Gallery
//
//  Created by Ibrahim El-geddawy on 10/28/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    class func products( completion : @escaping (_ message : String?, _ categories : [Categories]?) -> Void){
        
        let url = URLs.main
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion("error" , nil)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataDic = json.dictionary, let getDataDic = dataDic["posts"]?.array else {
                    print("Array error")
                    completion(nil, nil)
                    return}
                print(getDataDic.count)
                var categories = [Categories]()
                
                for data in getDataDic {
                    if let data = data.dictionary,let category = Categories(dic: data){
                        categories.append(category)
                        print(category.title, category.featuredImage, category.imageLarge)
                   
                    }
                    print(categories.count)
                }
                completion("success", categories)
                
            }
        }
    }
}


