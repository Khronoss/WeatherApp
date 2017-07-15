//
//  WeatherIconService.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

protocol WeatherIconService: class {
    func loadIcon(forName name: String, completion: @escaping (NSError?) -> Void) -> Void
    func getIcon(forName name: String) -> UIImage?
}
