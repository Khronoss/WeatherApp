//
//  WeatherIconServiceImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherIconServiceImpl: NSObject, WeatherIconService {

    private var icons: [String: UIImage] = [:]
    private var dataLoader: WeatherDataLoader
    
    init(dataLoader: WeatherDataLoader) {
        self.dataLoader = dataLoader
        
        super.init()
    }
    
    func loadIcon(forName name: String, completion: @escaping (NSError?) -> Void) {
        // loading iconName
        // if icon is in file system, load it instead
        // else load from OpenWeatherMap API
        
        dataLoader.getIconFromAPI(withName: name) { (image, error) in
            guard error == nil else {
                completion(error)
                return
            }
            
            self.icons[name] = image
            completion(nil)
        }
    }
    
    func getIcon(forName name: String) -> UIImage? {
        return icons[name]
    }
}
