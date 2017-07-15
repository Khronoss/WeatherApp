//
//  WeatherDataLoaderMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDataLoaderMock: NSObject, WeatherDataLoader {
    
    var predictions: [[String: Any]] = []
    
    func getPredictionsFromAPI(_ completion: @escaping ([[String: Any]], NSError?) -> Void) {
        
        completion(predictions, nil)
    }
    
    func getIconFromAPI(withName name: String, completion: @escaping (UIImage?, NSError?) -> Void) {
        let icon = UIImage(named: "FakeWeatherIcon")
        
        completion(icon, nil)
    }
}
