//
//  WeatherDetailModuleInitializer.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import Foundation

protocol WeatherDetailModuleInitializer: class {
    func initialize(interface: WeatherDetailInterface, withPrediction: Prediction) -> Void
}
