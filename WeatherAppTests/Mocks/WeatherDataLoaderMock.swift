//
//  WeatherDataLoaderMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDataLoaderMock: NSObject, WeatherDataLoader {
    
    func getPredictionsFromAPI(_ completion: @escaping (Any?, NSError?) -> Void) {
        completion(nil, nil)
    }
}
