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
    private var listService: WeatherListService
    private var iconService: WeatherIconService
    
    private(set) var predictions: [Prediction] = []
    
    init(interface: WeatherListInterface, listService: WeatherListService, iconService: WeatherIconService) {
        self.interface = interface
        self.listService = listService
        self.iconService = iconService
        
        super.init()
    }
    
    func loadPredictions() -> Void {
        interface.setLoading(true)
        
        listService.loadPredictions { (error) in
            self.loadEnded(error)
        }
    }
    
    private func loadEnded(_ error: NSError?) -> Void {
        interface.setLoading(false)
        
        if error == nil {
            handleLoadingSucceed()
        } else {
            interface.presentError(error!)
        }
    }
    
    private func handleLoadingSucceed() -> Void {
        predictions = listService.getPredictions()
        interface.updateView()
        
        loadPredictionsImages()
    }

    private func loadPredictionsImages() {
        for prediction in predictions {
            loadIcon(forPrediction: prediction)
        }
    }
    
    private func loadIcon(forPrediction prediction: Prediction) {
        let iconName = prediction.weathers.first!.iconName
        
        iconService.loadIcon(forName: iconName) { (error) in
            guard error == nil else {
                return
            }
            
            self.reloadPrediction(prediction)
        }
    }
    
    private func reloadPrediction(_ prediction: Prediction) -> Void {
        if let index = predictions.index(of: prediction) {
            interface.reloadPrediction(atIndex: index)
        }
    }
    
    func dateString(forPrediction prediction: Prediction) -> String {
        let date = Date(timeIntervalSince1970: prediction.daytime)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
    
    func celciusString(forPrediction prediction: Prediction) -> String {
        let roundedTemp = String(format: "%.1f", prediction.temperature.day)

        return "\(roundedTemp)°C"
    }
    
    func icon(forPrediction prediction: Prediction) -> UIImage? {
        let iconName = prediction.weathers.first!.iconName

        return iconService.getIcon(forName: iconName)
    }
}
