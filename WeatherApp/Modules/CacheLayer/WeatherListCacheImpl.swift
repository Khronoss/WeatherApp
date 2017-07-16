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
    private var dateFactory: DateFactory
    
    init(defaults: UserDefaults, dateFactory: DateFactory) {
        self.defaults = defaults
        self.dateFactory = dateFactory
        
        super.init()
    }
    
    func setCachedPredictions(_ predictions: [Prediction], forCityId cityId: Int) {
    }
    
    func cachedPredictions(forCityId cityId: Int) throws -> [Prediction] {
    }
}
