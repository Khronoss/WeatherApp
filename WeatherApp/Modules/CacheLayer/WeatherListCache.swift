//
//  WeatherListCache.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import Foundation

enum WeatherListCacheError: Error {
    case PredictionsNotFound
}

protocol WeatherListCache: class {
    func setCachedPredictions(forCityId cityId: Int) -> Void
    func cachedPredictions(forCityId cityId: Int) throws -> [Prediction]
}
