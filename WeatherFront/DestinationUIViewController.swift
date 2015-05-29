//
//  DestinationUIViewController.swift
//  WeatherFront
//
//  Created by 轲阳 郑 on 5/27/15.
//  Copyright (c) 2015 轲阳 郑. All rights reserved.
//

import UIKit

class DestinationWeatherUIViewController: UIViewController {
    
    var destinationCity: String = ""

    @IBOutlet weak var destinationName: UILabel!
    
    
    @IBOutlet weak var presentDayDay: UILabel!
    @IBOutlet weak var presentDayDate: UILabel!
    @IBOutlet weak var presentDayWeatherText: UILabel!
    @IBOutlet weak var presentDayLowestTemp: UILabel!
    @IBOutlet weak var presentDayHighestTemp: UILabel!
    @IBOutlet weak var presentDayWeatherLogo: UIImageView!
    
    
    @IBOutlet weak var tomorrowDay: UILabel!
    @IBOutlet weak var tomorrowDate: UILabel!
    @IBOutlet weak var tomorrowWeatherText: UILabel!
    @IBOutlet weak var tomorrowLowestTemp: UILabel!
    @IBOutlet weak var tomorrowHighestTemp: UILabel!
    @IBOutlet weak var tomorrowWeatherLogo: UIImageView!
    
    
    @IBOutlet weak var theDayAfterDay: UILabel!
    @IBOutlet weak var theDayAfterDate: UILabel!
    @IBOutlet weak var theDayAfterWeatherText: UILabel!
    @IBOutlet weak var theDayAfterLowestTemp: UILabel!
    @IBOutlet weak var theDayAfterHighestTemp: UILabel!
    @IBOutlet weak var theDayAfterWeatherLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if destinationCity != "" {
            let dataSource = WeatherData(cityName: destinationCity)
            destinationName.text = destinationCity
            updateUIInfo(dataSource)
        }
        
    }
    
    private func updateUIInfo(data: WeatherData){
        destinationName.text = data.cityShowName
        
        presentDayDay.text = data.presentDay.day
        presentDayDate.text = data.presentDay.date
        presentDayHighestTemp.text = data.presentDay.HighestTemp
        presentDayLowestTemp.text = data.presentDay.lowestTemp
        presentDayWeatherText.text = data.presentDay.weatherText
        
        tomorrowDay.text = data.tomorrow.day
        tomorrowDate.text = data.tomorrow.date
        tomorrowHighestTemp.text = data.tomorrow.HighestTemp
        tomorrowLowestTemp.text = data.tomorrow.lowestTemp
        tomorrowWeatherText.text = data.tomorrow.weatherText
        
        theDayAfterDay.text = data.theDayAfter.day
        theDayAfterDate.text = data.theDayAfter.date
        theDayAfterHighestTemp.text = data.theDayAfter.HighestTemp
        theDayAfterLowestTemp.text = data.theDayAfter.lowestTemp
        theDayAfterWeatherText.text = data.theDayAfter.weatherText
    }
    
    
}
