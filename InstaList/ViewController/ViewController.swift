//
//  ViewController.swift
//  InstaList
//
//  Created by Mohammed Atif on 15/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UI Binder Methods
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    //MARK: Variables
    
    let fetchListService: FetchList = FetchList()
    var newsFeed: [NewsDataModel]?
    
    //MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.rowHeight = 200
        updateNewsFeed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Functions
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsFeedCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifier.NEWS_FEED_CELL_ID,
            for: indexPath
        ) as! NewsFeedCell
        if let feedData = self.newsFeed?[indexPath.row] {
            print(String(describing: feedData))
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let newsItemList = newsFeed {
            return newsItemList.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Private Methods
    
    func updateNewsFeed() -> Void {
        fetchListService.getNewsFeed(
            url: "Hello World",
            requestType: 1,
            onComplete: { (result, code) in
                print(String(describing: result)+String(code))
                self.newsFeed = result
        },
            onError: { (errorCode) in
                print(String(errorCode))
        })
    }
}

