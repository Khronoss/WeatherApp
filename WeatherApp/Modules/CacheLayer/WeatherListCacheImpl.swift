//
//  WeatherListCacheImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListCacheImpl: NSObject, WeatherListCache {
    
    private var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
        
        super.init()
    }
    
    func setCachedPredictions(forCityId cityId: Int) {
    }
    
    func cachedPredictions(forCityId cityId: Int) throws -> [Prediction] {
    }
}
