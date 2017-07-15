//
//  WeatherListServiceMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListServiceMock: NSObject, WeatherListService {
    var predictions: [Prediction] = []
    
    func loadPredictions(_ completion: @escaping (NSError?) -> Void) {
        completion(nil)
    }
    
    func getPredictions() -> [Prediction] {
        return predictions
    }
}
