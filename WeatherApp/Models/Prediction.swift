//
//  Prediction.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class Prediction: NSObject {
    
    var daytime: Double
    var temperature: Temperature
    var pressure: Float
    var humidity: Int
    var weathers: [Weather]
    var windSpeed: Float
    var windDirection: Int
    var cloudiness: Int

    init(withJSON json: [String: Any]) {
        daytime = json["dt"] as? Double ?? 0
        pressure = json["pressure"] as? Float ?? 0
        humidity = json["humidity"] as? Int ?? 0
        windSpeed = json["speed"] as? Float ?? 0
        windDirection = json["deg"] as? Int ?? 0
        cloudiness = json["clouds"] as? Int ?? 0

        let tempJSON = json["temp"] as? [String: Any] ?? [:]
        temperature = Temperature(withJSON: tempJSON)

        let weathersJSON = json["weather"] as? [[String: Any]] ?? []
        weathers = weathersJSON.map({ (json) -> Weather in
            return Weather(withJSON: json)
        })

        super.init()
    }
}
