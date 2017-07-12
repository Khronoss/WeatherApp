//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by Anthony Merle on 12/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListPresenter: NSObject {
    
    private var interface: WeatherListInterface
    
    init(interface: WeatherListInterface) {
        self.interface = interface
        
        super.init()
    }
    
    func initializeListOfPredictions() -> Void {
        // loading list of predictions
        // if cache has predictions and are from today, load them
        // else load from OpenWeatherMap API
    }
    
}
