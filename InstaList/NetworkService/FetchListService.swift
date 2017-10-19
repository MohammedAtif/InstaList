//
//  FetchListService.swift
//  InstaList
//
//  Created by Mohammed Atif on 19/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Protocol

protocol FetchListProtocol{
    init()
    func getNewsFeed(url:String, requestType:Int, onComplete:([NewsDataModel], Int)->Void, onError:(Int)->Void) -> Void
}

//MARK: Delegate Class

public class FetchList: FetchListProtocol {
    
    required public init() {
        
    }
    
    func getNewsFeed(url: String, requestType:Int, onComplete: ([NewsDataModel], Int)->Void, onError:(Int)->Void) {
        let result = Constants.Url.BASE_URL
        onComplete([NewsDataModel(newsData: result)], requestType)
        onError(requestType)
    }
}
