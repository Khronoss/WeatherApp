//
//  WeatherListServiceImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListServiceImpl: NSObject, WeatherListService {
    
    private var predictions: [Prediction] = []
    
    private var dataLoader: WeatherDataLoader
    
    init(dataLoader: WeatherDataLoader) {
        self.dataLoader = dataLoader
        
        super.init()
    }
    
    func loadPredictions(_ completion: @escaping (NSError?) -> Void) {
        // loading list of predictions
        // if cache has predictions and are from today, load them
        // else load from OpenWeatherMap API
        
        dataLoader.getPredictionsFromAPI { (predictions, error) in
            
            self.predictions = predictions
            
            completion(error)
        }
    }
    
    func getPredictions() -> [Prediction] {
        return predictions
    }
}
