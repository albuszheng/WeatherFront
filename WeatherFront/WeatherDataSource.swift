//
//  WeatherDataSource.swift
//  WeatherFront
//
//  Created by 轲阳 郑 on 5/27/15.
//  Copyright (c) 2015 轲阳 郑. All rights reserved.
//

//  Using Yahoo Weather API as the data source
import Foundation

struct dayWeatherValues {
    var day: String = ""
    var date: String = ""
    var lowestTemp = ""
    var HighestTemp = ""
    var weatherText = ""
}

public class WeatherData{
    
    private var city: String
    
    var presentDay = dayWeatherValues()
    var tomorrow = dayWeatherValues()
    var theDayAfter = dayWeatherValues()
    
    init (cityName: String) {
        city = cityName
        getInfo()
    }
    
    func getInfo() {
        let query = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"\(city)\")"
        
        var yql = YQL()
        
        let result = JSON(yql.query(query))
        
        let response = result["query"]["results"]["channel"]
        
        presentDay.day = response["item"]["forecast"][0]["day"].string!
        presentDay.date = response["item"]["forecast"][0]["date"].string!
        presentDay.lowestTemp = response["item"]["forecast"][0]["low"].string!
        presentDay.HighestTemp = response["item"]["forecast"][0]["high"].string!
        presentDay.weatherText = response["item"]["forecast"][0]["text"].string!
        
        tomorrow.day = response["item"]["forecast"][1]["day"].string!
        tomorrow.date = response["item"]["forecast"][1]["date"].string!
        tomorrow.lowestTemp = response["item"]["forecast"][1]["low"].string!
        tomorrow.HighestTemp = response["item"]["forecast"][1]["high"].string!
        tomorrow.weatherText = response["item"]["forecast"][1]["text"].string!
        
        theDayAfter.day = response["item"]["forecast"][2]["day"].string!
        theDayAfter.date = response["item"]["forecast"][2]["date"].string!
        theDayAfter.lowestTemp = response["item"]["forecast"][2]["low"].string!
        theDayAfter.HighestTemp = response["item"]["forecast"][2]["high"].string!
        theDayAfter.weatherText = response["item"]["forecast"][2]["text"].string!
    }
    
    
}
