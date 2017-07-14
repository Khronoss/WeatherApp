//
//  WeatherListService.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import Foundation

protocol WeatherListService: class {
    func loadPredictions(_ completion: @escaping (NSError?) -> Void) -> Void
    func getPredictions() -> [Any]
}
