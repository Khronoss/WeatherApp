//
//  WeatherDataLoader.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import Foundation

protocol WeatherDataLoader: class {
    func getPredictionsFromAPI(_ completion: @escaping ([[String: Any]], NSError?) -> Void) -> Void
}
