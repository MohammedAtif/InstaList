//
//  ImageDataModel.swift
//  InstaList
//
//  Created by Mohammed Atif on 19/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import Foundation

struct NewsDataModel {
    
    var title: String?
    var description: String?
    var author: String?
    var added: String?
    
    init(newsData: Any) {
        if let jsonData = newsData as? [String: Any] {
            title = jsonData[Constants.JSONKey.TITLE] as? String
            description = jsonData[Constants.JSONKey.DESCRIPTION] as? String
            author = jsonData[Constants.JSONKey.AUTHOR] as? String
            added = jsonData[Constants.JSONKey.PUBLISHED_AT] as? String
        }
    }
}
