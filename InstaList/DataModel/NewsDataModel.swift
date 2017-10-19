//
//  ImageDataModel.swift
//  InstaList
//
//  Created by Mohammed Atif on 19/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import Foundation

struct NewsDataModel {
    var id: Int?
    var name: String?
    var author: String?
    var url: String?
    
    init(newsData: Any) {
        if let jsonData = newsData as? [String: Any] {
            id = jsonData["user_id"] as? Int
            name = jsonData["name"] as? String
            author = jsonData["author"] as? String
            url = jsonData["author"] as? String
        }
    }
}
