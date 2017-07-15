//
//  WeatherListInterface.swift
//  WeatherApp
//
//  Created by Anthony Merle on 12/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import Foundation

protocol WeatherListInterface: class {
    func updateView() -> Void
    func setLoading(_ isLoading: Bool) -> Void
    
    func reloadPrediction(atIndex index: Int) -> Void
}
