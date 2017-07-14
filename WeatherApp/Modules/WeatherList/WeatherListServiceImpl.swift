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
        
        dataLoader.getPredictionsFromAPI { (predictionsJSON, error) in
            
            self.initPredictions(fromJSON: predictionsJSON)
            
            completion(error)
        }
    }
    
    private func initPredictions(fromJSON jsons: [[String: Any]]) -> Void {
        
        var predictions = jsons.map { (json) -> Prediction in
            return Prediction(withJSON: json)
        }

        predictions.sort { $0.0.daytime < $0.1.daytime }
        
        self.predictions = predictions
    }
    
    func getPredictions() -> [Prediction] {
        return predictions
    }
}
