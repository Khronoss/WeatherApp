//
//  WeatherAPIConfiguration.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherAPIConfiguration: NSObject {
    let hostName = "https://openweathermap.org"
    let versionUrlPart = "/data/2.5"

    let appKey = "b1b15e88fa797225412429c1c50c122a1"
    
    let desiredUnitSystem = "metric"
    
    func fullApiPath() -> String {
        return "\(hostName)\(versionUrlPart)"
    }
}
