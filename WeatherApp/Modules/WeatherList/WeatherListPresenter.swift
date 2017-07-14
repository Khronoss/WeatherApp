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
    private var weatherService: WeatherListService
    
    init(interface: WeatherListInterface, weatherService: WeatherListService) {
        self.interface = interface
        self.weatherService = weatherService
        
        super.init()
    }
    
    func loadPredictions() -> Void {
        interface.updateView()
    }
    
}
