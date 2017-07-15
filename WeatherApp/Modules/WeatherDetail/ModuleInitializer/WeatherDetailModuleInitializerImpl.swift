//
//  WeatherDetailModuleInitializerImpl.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDetailModuleInitializerImpl: NSObject, WeatherDetailModuleInitializer {
    
    func initialize(interface: WeatherDetailInterface, withPrediction prediction: Prediction) -> Void {
        guard let controller = interface as? WeatherDetailViewController else {
            return
        }
        
        let iconService = createIconService()
        
        let presenter = WeatherDetailPresenter(interface: interface, iconService: iconService)

        controller.presenter = presenter

        presenter.setPrediction(prediction)
    }
    
    private func createIconService() -> WeatherIconService {
        let config = WeatherAPIConfiguration()
        let dataLoader = WeatherDataLoaderImpl(configuration: config)
        let iconService = WeatherIconServiceImpl(dataLoader: dataLoader)
        
        return iconService
    }
}
