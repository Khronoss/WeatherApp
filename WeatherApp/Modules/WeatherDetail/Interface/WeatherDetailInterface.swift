//
//  WeatherDetailInterface.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

protocol WeatherDetailInterface: class {
    func updateView(withPrediction prediction: Prediction) -> Void
    
    func setIconImage(_ icon: UIImage) -> Void
}
