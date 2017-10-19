//
//  SourceDataModel.swift
//  InstaList
//
//  Created by Mohammed Atif on 19/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import Foundation

struct SourceDataModel {
    var id: String?
    var name: String?
    var description: String?
    
    init(sourceData: Any) {
        if let jsonData = sourceData as? [String: Any] {
            id = jsonData[Constants.JSONKey.ID] as? String
            name = jsonData[Constants.JSONKey.NAME] as? String
            description = jsonData[Constants.JSONKey.DESCRIPTION] as? String
        }
    }
}
