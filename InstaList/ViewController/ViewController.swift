//
//  ViewController.swift
//  InstaList
//
//  Created by Mohammed Atif on 15/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fetchListService: FetchList = FetchList()
    
    //MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListService.getImagesList(
            url: "Hello World",
            requestType: 1,
            onComplete: { (result, code) in
                print(result+String(code))
                
        },
            onError: { (errorCode) in
                print(String(errorCode))
                
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Methods
}

