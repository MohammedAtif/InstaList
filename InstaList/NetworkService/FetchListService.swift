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
    func getNewsSource(url: String, requestType: HTTPMethod, onComplete: @escaping ([SourceDataModel], Int)->Void, onError: @escaping (Int)->Void)
    func getNewsFeed(url:String, sourceId: String, onComplete: @escaping ([NewsDataModel], Int)->Void, onError: @escaping (Int)->Void) -> Void
}

//MARK: Delegate Class

public class FetchList: FetchListProtocol {
    
    func getNewsSource(url: String, requestType: HTTPMethod, onComplete: @escaping ([SourceDataModel], Int)->Void, onError: @escaping (Int)->Void){
        Alamofire.request(url, method: requestType)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch(response.result){
                case .success:
                    var feedDataList: [SourceDataModel] = []
                    let responseData = response.data!
                    print("Respose is\n\(responseData)")
                    if let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]{
                        let count  = jsonData?.count
                        print("count \(count!)")
                        let sourceList = jsonData![Constants.JSONKey.SOURCES] as! [Any]
                        print("source count \(sourceList.count)")
                        for i in 0..<sourceList.count {
                            let sourceData = sourceList[i]
                            feedDataList.append(SourceDataModel(sourceData: sourceData))
                        }
                        onComplete(feedDataList, response.response!.statusCode)
                    }
                case .failure(let error):
                    print(error)
                    onError(response.response!.statusCode)
                }
        }
    }
    
    func getNewsFeed(url: String, sourceId: String, onComplete: @escaping ([NewsDataModel], Int)->Void, onError:@escaping (Int)->Void) {
        
        let parameters: Parameters = [
            "source": sourceId,
            Constants.API.API_KEY: Constants.API.KEY_VALUE
        ]
        
        Alamofire.request(url, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch(response.result){
                case .success:
                    var feedDataList: [NewsDataModel] = []
                    let responseData = response.data!
                    print("Respose is\n\(responseData)")
                    if let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]{
                        let count  = jsonData?.count
                        print("count \(count!)")
                        let articleList = jsonData![Constants.JSONKey.ARTICLES] as! [Any]
                        print("source count \(articleList.count)")
                        for i in 0..<articleList.count {
                            let articleData = articleList[i]
                            feedDataList.append(NewsDataModel(newsData: articleData))
                        }
                        onComplete(feedDataList, response.response!.statusCode)
                    }
                case .failure(let error):
                    print(error)
                    onError(response.response!.statusCode)
                }
        }
    }
}
