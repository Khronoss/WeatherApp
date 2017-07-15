//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDetailPresenter: NSObject {

    private var prediction: Prediction?
    
    private var interface: WeatherDetailInterface
    private var iconService: WeatherIconService

    init(interface: WeatherDetailInterface, iconService: WeatherIconService) {
        self.interface = interface
        self.iconService = iconService
        
        super.init()
    }
 
    func setPrediction(_ prediction: Prediction) -> Void {
        self.prediction = prediction
        
        interface.updateView(withPrediction: prediction)
        
        loadPredictionIcon()
    }
    
    func loadPredictionIcon() {
        let iconName = prediction!.weathers.first!.iconName
        
        iconService.loadIcon(forName: iconName) { (error) in
            guard error == nil else {
                return
            }
            
            if let icon = self.iconService.getIcon(forName: iconName) {
                self.interface.setIconImage(icon)
            }
        }
    }
}
