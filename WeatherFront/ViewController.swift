//
//  ViewController.swift
//  WeatherFront
//
//  Created by 轲阳 郑 on 5/27/15.
//  Copyright (c) 2015 轲阳 郑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var destinationName: UITextField?
    
    fileprivate var cityName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func targetCityGo(_ sender: UIButton) {
        if let dcName = destinationName!.text {
            cityName = dcName
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDestinationWeather" {
            var destinationVC = segue.destination as? UIViewController
            if let navController = destinationVC as? UINavigationController {
                destinationVC = navController.topViewController
                
                if let dwvc = destinationVC as? DestinationWeatherUIViewController {
                    if destinationName!.text != nil {
                        dwvc.destinationCity = destinationName!.text!
                    }
                }
            }
            
        }
//        var destinationVC = segue.destinationViewController as? UIViewController
//        if let navController = destinationVC as? UINavigationController {
//            destinationVC = navController.topViewController
//        }
//        
//        if let dwvc = destinationVC as? DestinationWeatherUIViewController {
//            if let identifier = segue.identifier {
//                switch identifier {
//                case "showDestinationWeather":
//                    if destinationName!.text != nil {
//                        dwvc.destinationCity = destinationName!.text
//                    }
//                case "showInfo": fallthrough
//                default: break
//                }
//            }
//        }
    }

}

