//
//  YUI.swift
//  WeatherFront
//
//  Created by 轲阳 郑 on 5/28/15.
//  Copyright (c) 2015 轲阳 郑. All rights reserved.
//

import Foundation

open class YQL {
    fileprivate let prefixURL = "https://query.yahooapis.com/v1/public/yql?q="
    
    fileprivate let suffixURL = "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    
    func query(_ statement: String) -> NSDictionary {
        let query = prefixURL + "\(statement.addingPercentEscapes(using: String.Encoding.ascii)!)" + suffixURL
        
        do {
            let jsonData = try String(contentsOf: URL(string: query)!, encoding: String.Encoding.utf8).data(using: String.Encoding.utf8)
            
            let result = try { _ -> NSDictionary in
                if let data = jsonData
                {
//                    var error: NSError?
                    
                    if let res = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        
                        return res
                    } else {
                        return NSDictionary()
                    }
                    
                }
                
                return NSDictionary()
            }()
            
            return result
        } catch {
            return NSDictionary()
        }
        
//        var result = { _ -> NSDictionary in
//            if let data = jsonData
//            {
//                var error: NSError?
//                
//                if let res = JSONSerialization.JSONObjectWithData(data, options: JSONSerialization.ReadingOptions.MutableContainers, error: &error) as? NSDictionary {
//                    
//                    return res
//                } else {
//                    return NSDictionary()
//                }
//
//            }
//            
//            return NSDictionary()
//        }()
//        
//        return result
    }
}
