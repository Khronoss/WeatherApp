//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by Anthony Merle on 12/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListPresenter: NSObject {
    
    private var interface: WeatherListInterface
    private var weatherService: WeatherListService
    
    private(set) var predictions: [Prediction] = []
    
    init(interface: WeatherListInterface, weatherService: WeatherListService) {
        self.interface = interface
        self.weatherService = weatherService
        
        super.init()
    }
    
    func loadPredictions() -> Void {
        // show loading
        weatherService.loadPredictions { (error) in
            // end loading
            // check error
            self.handleLoadingSucceed()
        }
    }
    
    private func handleLoadingSucceed() -> Void {
        predictions = weatherService.getPredictions()
        interface.updateView()
    }
    
    func dateString(forPrediction prediction: Prediction) -> String {
        let date = Date(timeIntervalSince1970: prediction.daytime)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
    
    func celciusString(forPrediction prediction: Prediction) -> String {
        return "\(prediction.temperature.day)°C"
    }
}
