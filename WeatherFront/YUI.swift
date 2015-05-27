//
//  YUI.swift
//  WeatherFront
//
//  Created by 轲阳 郑 on 5/28/15.
//  Copyright (c) 2015 轲阳 郑. All rights reserved.
//

import Foundation

public class YQL {
    private let prefixURL = "https://query.yahooapis.com/v1/public/yql?q="
    
    private let suffixURL = "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    
    func query(statement: String) -> NSDictionary {
        let query = prefixURL + "\(statement.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)" + suffixURL
        
        let jsonData = String(contentsOfURL: NSURL(string: query)!, encoding: NSUTF8StringEncoding, error: nil)?.dataUsingEncoding(NSUTF8StringEncoding)
        
        var result = { _ -> NSDictionary in
            if let data = jsonData
            {
                var error: NSError?
                
                if let res = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary {
                    
                    return res
                } else {
                    return NSDictionary()
                }

            }
            
            return NSDictionary()
        }()
        
        return result
    }
}