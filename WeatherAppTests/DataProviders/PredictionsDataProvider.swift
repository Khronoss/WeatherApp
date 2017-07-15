//
//  PredictionsDataProvider.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class PredictionsDataProvider: NSObject {

    func singleFakePrediction() -> [String: Any] {
        let tempJSON: [String: Any] = [
            "day": 22.33,
            "min": 13.85,
            "max": 23.2,
            "night": 13.85,
            "eve": 21.79,
            "morn": 22.33
        ]
        
        let weatherJSON: [String: Any] = [
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
        ]
        
        let json: [String: Any] = [
            "dt": 1500030000,
            "temp": tempJSON,
            "pressure": 1021.07,
            "humidity": 62,
            "weather": [
                weatherJSON
            ],
            "speed": 4.72,
            "deg": 275,
            "clouds": 0
        ]
        
        return json
    }

    func createMultipleFakePredictions(count: Int) -> [[String: Any]] {
        var predictions: [[String: Any]] = []
        for _ in 0..<count {
            predictions.append(singleFakePrediction())
        }
        return predictions
    }
}
