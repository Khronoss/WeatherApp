//
//  PredictionInformationsFormatter.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class PredictionInformationsFormatter: NSObject {
    func dateString(forPrediction prediction: Prediction) -> String {
        let date = Date(timeIntervalSince1970: prediction.daytime)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
    
    func celciusString(forPrediction prediction: Prediction) -> String {
        let roundedTemp = String(format: "%.1f", prediction.temperature.day)
        
        return "\(roundedTemp)°C"
    }
    
    func windSpeedString(forPrediction prediction: Prediction) -> String {
        return "\(prediction.windSpeed) km/h"
    }

    func humidityString(forPrediction prediction: Prediction) -> String {
        return "\(prediction.humidity)%"
    }
}
