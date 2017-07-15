//
//  WeatherIconServiceMock.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherIconServiceMock: NSObject, WeatherIconService {
    var icon: UIImage? = nil
    
    func loadIcon(forName name: String, completion: @escaping (NSError?) -> Void) {
        completion(nil)
    }
    
    func getIcon(forName name: String) -> UIImage? {
        return icon
    }
}
