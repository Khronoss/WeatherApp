//
//  WeatherDataLoader.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

protocol WeatherDataLoader: class {
    func getPredictionsFromAPI(_ completion: @escaping ([[String: Any]], NSError?) -> Void) -> Void

    func getIconFromAPI(withName name: String, completion: @escaping (UIImage?, NSError?) -> Void) -> Void
}
