//
//  Constants.swift
//  InstaList
//
//  Created by Mohammed Atif on 19/10/17.
//  Copyright © 2017 Mohammed Atif. All rights reserved.
//

import Foundation

public class Constants {
    public class Url {
        public static let BASE_URL = "https://newsapi.org/v1/"
        public static let SOURCES = "sources"
        public static let ARTICLES = "articles"
    }
    public class API {
        public static let API_KEY = "apiKey"
        public static let KEY_VALUE = "faf8b66c807b4af9946eb1990bb9b167"
    }
    public class Identifier {
        public static let NEWS_FEED_CELL_ID = "news_feed_cell"
    }
    public class JSONKey {
        public static let SOURCES = "sources"
        public static let ID = "id"
        public static let NAME = "name"
        public static let DESCRIPTION = "description"
        public static let URL = "url"
        
        public static let ARTICLES = "articles"
        public static let AUTHOR = "author"
        public static let TITLE = "title"
        public static let PUBLISHED_AT = "publishedAt"
    }
}
