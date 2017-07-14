//
//  WeatherListModuleInitializer.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListModuleInitializer: NSObject {

    func initialize(controller: WeatherListViewController) -> Void {
        
        let service = createWeatherListService()
        
        let presenter = WeatherListPresenter(interface: controller, weatherService: service)

        controller.presenter = presenter
    }
    
    private func createWeatherListService() -> WeatherListService {
        let dataLoaderConfig = WeatherAPIConfiguration()
        let dataLoader = WeatherDataLoaderImpl(configuration: dataLoaderConfig)
        let service = WeatherListServiceImpl(dataLoader: dataLoader)

        return service
    }
}
