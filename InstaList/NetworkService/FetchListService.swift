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
    func getImagesList(url:String, requestType:Int, onComplete:(String, Int)->Void, onError:(Int)->Void) -> Void
}

//MARK: Delegate Class

public class FetchList: FetchListProtocol {
    
    required public init() {
        
    }
    
    func getImagesList(url: String, requestType:Int, onComplete: (String, Int)->Void, onError:(Int)->Void) {
        let result = Constants.Url.BASE_URL
        onComplete(result, requestType)
        onError(requestType)
    }
}
