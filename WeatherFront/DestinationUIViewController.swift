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
    @IBOutlet weak var weatherImageMain: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var tempLow: UILabel!
    @IBOutlet weak var tempHigh: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if destinationCity != "" {
            let dataSource = WeatherData(cityName: destinationCity)
            destinationName.text = destinationCity
            updateUIInfo(dataSource)
        }
        
    }
    
    fileprivate func updateUIInfo(_ data: WeatherData){

    }
    
    
}
